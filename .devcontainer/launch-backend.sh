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
echo "Creating dirs to symlink to frontend"
#To connect to webpack-stats
mkdir /code/fragalysis-backend/frontend
mkdir /code/fragalysis-backend/static/bundles 
chown -R root:www-data /code/fragalysis-backend/static

echo "Symlinking webpack-stats and bundle/main.js to frontend"

function checksymlink {
if [ -L $symlink ] ; then
   if [ -e $symlink ] ; then
      echo "Link good"
   else
      echo "Broken - create link"
      ln -s  $symlink $pathtolink 
   fi
elif [ -e $symlink ] ; then
   echo "Not a link"
else
   echo "Missing - create link"
   ln -s  $symlink $pathtolink 
fi
}

echo "Check if link exists"
checksymlink /code/frontend/bundles /code/fragalysis-backend/static/bundles
checksymlink /code/frontend/webpack-stats.json /code/fragalysis-backend/frontend/webpack-stats.json

echo "Running migrations..."
cd /code/fragalysis-backend/
# initial migrations for existing stack
python3 manage.py makemigrations
python3 manage.py migrate

echo "Running collectstatic..."
python3 manage.py collectstatic --noinput -v 0 # collect static files
