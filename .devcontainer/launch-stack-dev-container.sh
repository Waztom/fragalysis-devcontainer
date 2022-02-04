#!/bin/bash
/bin/bash /code/.devcontainer/makemigrations-dev-container.sh
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
printf "$script" | python3 manage.py shell

# Prepare log files and start outputting logs to stdout
touch /srv/logs/gunicorn.log
touch /srv/logs/access.log
tail -n 0 -f /srv/logs/*.log &

echo "Testing nginx config..."
nginx -t
echo "Running nginx..."
service nginx reload
# service nginx start

# Start Gunicorn processesv -> binding set for docker container port
cd /code/fragalysis-backend/
echo "Starting Gunicorn...."
gunicorn fragalysis.wsgi:application --name fragalysis --bind 0.0.0.0:8080 


