.PHONY: install
install:
	pip3 install -U poetry
	poetry install

.PHONY: format
format:
	poetry run autoflake --remove-all-unused-imports --in-place -r --exclude __init__.py .
	poetry run isort .
	poetry run black .

.PHONY: lint
lint:
	poetry run autoflake --remove-all-unused-imports --in-place -r --exclude __init__.py --check .
	poetry run isort --check-only .
	poetry run black --check .
	poetry run pflake8 .

.PHONY: test
test:
	docker-compose run --rm web pytest ./app -x -vv --reuse-db

.PHONY: build
build:
	docker-compose build

.PHONY: start
start:
	docker-compose up -d

.PHONY: collectstatic
collectstatic:
	docker-compose run --rm web python ./app/manage.py collectstatic --no-input

.PHONY: makemigrations
makemigrations:
	docker-compose run --rm web python ./app/manage.py makemigrations

.PHONY: migrate
migrate:
	docker-compose run --rm web python ./app/manage.py migrate

.PHONY: dev-server
dev-server:
	docker-compose run --rm -p 9001:9001 web python ./app/manage.py runserver_plus 0:9001 --print-sql --nopin -v 3

.PHONY: shell_plus
shell_plus:
	docker-compose run --rm web python ./app/manage.py shell_plus --print-sql
