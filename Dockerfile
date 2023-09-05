FROM python:3.12.0rc1-alpine3.18

RUN apk update && \
    apk upgrade && \
    apk add --no-cache libpq-dev postgresql-client \
    libxml2-dev libxslt-dev g++ libffi-dev \
    freetype-dev gcc musl-dev jpeg-dev zlib-dev

WORKDIR /opt
COPY . .

RUN pip install -r requirements.txt

RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py createsu
RUN python manage.py shell < comandos.py

EXPOSE 8000

CMD ["python","manage.py","runserver","0.0.0.0:8000"]