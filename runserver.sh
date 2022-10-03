#!/bin/bash

if [[ "${DEBUG}" == "true" ]]; then
  python ./app/manage.py runserver 0.0.0.0:8000
else
  # (cpu_count * 2) + 2
  DEFAULT_WORKERS_NUM="$((($(nproc --all) * 2) + 2))"

  gunicorn \
    project.wsgi \
    --workers "${DEFAULT_WORKERS_NUM}" \
    --threads=2 \
    --bind 0.0.0.0:8000 \
    --chdir ./app \
    --timeout 30 \
    --max-requests 1000
fi
