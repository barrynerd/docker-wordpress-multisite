# Makefile

.PHONY: up init install down reset

up:
	docker compose up -d

init:
	@echo "🔧 Running WordPress (multisite) install (only if needed)..."
	./setup.sh

install: up init

down:
	docker compose down

reset:
	docker compose down -v

logs:
	docker compose logs -f

shell:
	docker compose exec wordpress bash
