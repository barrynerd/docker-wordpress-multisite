#!/bin/bash

# pick up the environment variables from the .env file
# and export them to the current shell
# This is necessary for the docker compose command to work
# without having to pass them as arguments
set -a
  source .env
set +a


echo "🔄 Waiting for the database to be ready..."
until docker compose run --rm wpcli db check > /dev/null 2>&1; do
  sleep 1
  echo "Waiting for the database..."
done
echo "✅ Database is ready..."

echo "🔄 Checking if WordPress is already installed..."
if ! docker compose run --rm wpcli core is-installed ; then
  echo "🚀 Installing WordPress (Multisite)..."
  echo "email: ${WP_ADMIN_EMAIL}"
  docker compose run --rm wpcli core install \
    --url="${WP_URL}" \
    --title="${WP_TITLE}" \
    --admin_user="${WP_ADMIN_USER}" \
    --admin_password="${WP_ADMIN_PASSWORD}" \
    --admin_email="bcaplan@gmail.com"
    # --admin_email="${WP_ADMIN_EMAIL}"

  echo "🌐 Enabling multisite..."
  docker compose run --rm --user 33:33 wpcli core multisite-convert --title="${WP_TITLE}" 

  # update .htaccess
  echo "🔧 Updating .htaccess..."
  docker compose cp htaccess_multisite_subdirectory.txt  wordpress:/var/www/html/.htaccess 
else
  echo "✅ WordPress is already installed."
fi

# echo "🔧 Updating wp-config.php for multisite constants..."


echo "✅ wp-config.php updated."