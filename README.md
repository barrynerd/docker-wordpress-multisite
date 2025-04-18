# Multi Site Wordpress Docker Container

Fire up Wordpress and go!

This comes with a funtioning PHP MyAdmin service, as configured in the .env file

Included are these services:
1. WordPress
2. Mariadb
3. wpcli
4. PHPMyAdmin

Reach out via github @ https://github.com/barrynerd with bugs, PRs and feature ideas

If you use this and like it, stars are appreciated!

**Requirements**
    <ol>
        <li>A running Docker service</li>
        <li>Linux to run the full setup, but you can do the WordPress configuration manually the usual way if you aren't on Linux</li>
    </ol>

**Tested on:**
    <ol>
        <li>Linux amd64</li>
    </ol>

**Not Tested on: (but you can help!)**
    <ol>
        <li>Linux arm64</li>
        <li>Mac</li>
        <li>Windows<p>...but this *might* work under WSL. I am unlikely to ever test that, but if you do, I welcome a PR with instructions and/or code changes</li>
    </ol>

**Instructions**
1. Clone this repo and cd into it
    ```sh
    git clone https://github.com/barrynerd/docker-wordpress-mulitsite.git
    ```
2. Copy .env.example to .env
    ```sh
    cp .env.example .env
    ```
3. Edit .env as needed for your situation
4. Fire up the container
    ```sh
    make up
    ```
5. Initialize WordPress (optional)
    ```sh
    make init
    ```
6. Find WordPress at http://localhost :{your WP port number from .env file}
7. Find PHPMyAdmin at http://localhost :{your PMA port number from .env file}
8. Use wpcli like this from within the project directory
    ```sh:
    docker compose run --rm wpcli plugin list
    ```

**Commands**

**up:**
    Bring up the docker container

**init:**
    Initialize a clean container (just started with *make up*)

**install:**
    Do both *make up* and *make init* in one step

**down:**
    Bring down the docker container (but persist the database)

**reset:**
    **USE WITH CAUTION**
    Bring down the docker container (**but destroy the database**)
	docker compose down -v

**logs:**
    Show what is happening in your docker containers

**shell:**
    Login as root to the wordpress service

**License**
- GPL 2.0 (please credit BarryNerd [https://github.com/barrynerd] in your derivative versions)

