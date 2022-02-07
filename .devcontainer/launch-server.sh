#!/bin/bash
# Prepare log files and start outputting logs to stdout
touch /srv/logs/gunicorn.log
touch /srv/logs/access.log
tail -n 0 -f /srv/logs/*.log &

echo "Testing nginx config..."
nginx -t
echo "Reloading nginx..."
service nginx reload 

# Start Gunicorn processesv -> binding set for docker container port
echo "Starting Gunicorn..."
cd /code/fragalysis-backend/
gunicorn fragalysis.wsgi:application --name fragalysis --bind 0.0.0.0:8080 


