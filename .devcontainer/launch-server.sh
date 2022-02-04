#!/bin/bash
# Prepare log files and start outputting logs to stdout
touch /srv/logs/gunicorn.log
touch /srv/logs/access.log
tail -n 0 -f /srv/logs/*.log &

echo "Testing nginx config..."
nginx -t
echo "Running nginx..."

# Start Gunicorn processesv -> binding set for docker container port
cd /code/fragalysis-backend/
echo "Starting Gunicorn...."
gunicorn fragalysis.wsgi:application --name fragalysis --bind 0.0.0.0:8080 


