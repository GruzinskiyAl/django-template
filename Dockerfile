FROM python:3.10-slim-buster

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install build-essential -y --no-install-recommends \
    curl \
    make \
    && rm -rf /var/lib/apt/lists/*
RUN pip install poetry

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

ENV PROJECT_ROOT=/home/ubuntu/service
WORKDIR $PROJECT_ROOT

COPY poetry.lock pyproject.toml ./
RUN poetry config virtualenvs.create false
RUN poetry install

COPY ./app $PROJECT_ROOT/app
COPY runserver.sh ./