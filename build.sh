#!/usr/bin/env bash

set -o errexit  # exit on error

pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate
./manage.py shell exec(open('createsu.py').read()) # new
#python createsu.py
# python manage.py comandos  # new