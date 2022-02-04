#!/bin/bash
echo "Creating superuser..."
# Automatically create the superuser...
script="
from django.contrib.auth.models import User
username = '$WEB_DJANGO_SUPERUSER_NAME'
password = '$WEB_DJANGO_SUPERUSER_PASSWORD'
email = '$WEB_DJANGO_SUPERUSER_EMAIL'
if not username or not password:
    username = 'admin'
    password = 'UNSECURED'
if User.objects.filter(username=username).count()==0:
    User.objects.create_superuser(username, email, password)
    print('Superuser created.')
else:
    print('Superuser creation skipped.')
"
echo "Running migrations..."
cd /code/fragalysis-backend/
# initial migrations for existing stack
python3 manage.py makemigrations
python3 manage.py migrate

echo "Running collectstatic..."
python3 manage.py collectstatic --noinput -v 0 # collect static files
