"""
Django settings for rafita project.

Generated by 'django-admin startproject' using Django 4.1.

For more information on this file, see
https://docs.djangoproject.com/en/4.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.1/ref/settings/
"""

from pathlib import Path
from django.contrib import messages 
from django.contrib.messages import constants as message_constants
import os
# Don't forget to import dj-database-url at the beginning of the file
import dj_database_url

# core/settings.py

from dotenv import load_dotenv

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

load_dotenv(BASE_DIR / '.env')


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.1/howto/deployment/checklist/
# In local the secret is only the secret expose
SECRET_KEY = os.getenv('SECRET_KEY')
# SECURITY WARNING: don't run with debug turned on in production! (In local is only True)
DEBUG = os.getenv('DEBUG', '0').lower() in ['true', 't', '1']

if DEBUG:
    STATIC_ROOT = [
        os.path.join(BASE_DIR, 'rafita/static')
    ]
else:
    STATICFILES_DIRS = os.path.join(BASE_DIR, 'rafita/static')


#Cuando DEBUG = False, Django no funcionará sin un valor adecuado para ALLOWED_HOSTS
ALLOWED_HOSTS = os.getenv('ALLOWED_HOSTS').split(' ')

#Puede obtener el nombre de su host de servicio web de la RENDER_EXTERNAL_HOSTNAMEvariable de entorno, que Render establece automáticamente.
RENDER_EXTERNAL_HOSTNAME = os.environ.get('RENDER_EXTERNAL_HOSTNAME')
if RENDER_EXTERNAL_HOSTNAME:    ALLOWED_HOSTS.append(RENDER_EXTERNAL_HOSTNAME)

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'SeguridadApp',
    'crispy_forms',
    'PedidosApp',
    'ComprasApp',
    'CajaApp',
    
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    #For Deploy
    'whitenoise.middleware.WhiteNoiseMiddleware',

    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',

]

ROOT_URLCONF = 'rafita.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR,'SeguridadApp/template'), os.path.join(BASE_DIR,'rafita/template'),
        os.path.join(BASE_DIR,'PedidosApp/template'),
        os.path.join(BASE_DIR,'CajaApp/template'),
        os.path.join(BASE_DIR,'ComprasApp/template')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'rafita.wsgi.application'


# Database
# https://docs.djangoproject.com/en/4.1/ref/settings/#databases

#Conexión PostgresSQL Local
# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.postgresql_psycopg2',
#         'NAME': 'rafita',
#         'USER': 'postgres',
#         'PASSWORD': '1234',
#         'HOST': '127.0.0.1',
#         'PORT': '5432',
#     }
# }

# Database Render Deployment
# https://docs.djangoproject.com/en/3.0/ref/settings/#databases

DATABASES = {
    'default': dj_database_url.parse(os.environ.get('DATABASE_URL'), conn_max_age=600),
}

# Password validation
# https://docs.djangoproject.com/en/4.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/4.1/topics/i18n/

LANGUAGE_CODE = 'es'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_PE = True




# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.1/howto/static-files/

STATIC_URL = 'static/'

#For Deployment
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'

LOGIN_URL = '/'

# Default primary key field type
# https://docs.djangoproject.com/en/4.1/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
CRISPY_TEMPLATE_PACK = 'bootstrap4'

#clases para los mensajes flash de bootstrap 
MESSAGE_TAGS={
message_constants.DEBUG:'debug',
message_constants.INFO:'info',
message_constants.SUCCESS:'succes',
message_constants.WARNING:'warning',
message_constants.ERROR:'danger',
}