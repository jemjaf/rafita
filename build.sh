#!/usr/bin/env bash

set -o errexit  # exit on error

pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate
python manage.py createsu # new
chmod u+x manage.py
chmod u+x comandos.py
./manage.py shell < comandos.py
# python manage.py comandos # new
# python ./createsu.py
# python manage.py comandos  # new

# gracias a https://testdriven.io/blog/django-render/ y a ChatGPT