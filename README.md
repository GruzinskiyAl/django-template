## Build and run

Note: update the environment variables in `.env` before running the following commands:

```shell
cd <project_folder>
docker-compose build
docker-compose up  # or "docker-compose up -d" to run in detached mode
```
Go to [http://localhost:8000](http://localhost:8000)

## Description

App consist of web application[python app], web server[nginx] and database container[postgres].  
Database container running only from dev compose file.  
For production dedicated database service should be configured.

### env variables
- `COMPOSE_FILE` - compose file/files to build application
- `DJANGO_SECRET_KEY` - application secret key
- `DEBUG` - debug mode (`1` | `0`)
- `POSTGRES_HOST` - host of database
- `POSTGRES_DB` - name of database
- `POSTGRES_USER` - database user
- `POSTGRES_PASSWORD` - database user password

## Development

Use the `Makefile` included for running different development tasks:

1. `make install` - locally installs the packages needed for development.
2. `make format` - runs `autoflake`, `isort` and `black` for fixing coding style.
3. `make lint` - runs `autoflake`, `isort`, `black` and `flake8` checks.
4. `make test` - run unit tests.
5. `make build` - build image.
6. `make start` - start containers.
7. `make collectstatic` - collect static files to `static` folder.
8. `make makemigrations` - generate migration scripts, if applicable.
9. `make migrate` - run migrations, if applicable.
10. `make dev-server` - run dev server on 9001 port in attached mode
11. `make shell_plus` - run shell console with printing sql queries
