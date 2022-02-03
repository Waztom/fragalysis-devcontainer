FROM informaticsmatters/rdkit-python3-debian:Release_2021_09_2
ENV PYTHONUNBUFFERED 1

USER root

COPY ./fragalysis-backend/requirements.txt /code/requirements.txt
COPY ./fragalysis-frontend/package.json /code/fragalysis-frontend/package.json

WORKDIR /code
RUN pip install -r requirements.txt

RUN \
 apt-get update && \ 
 apt-get upgrade -y && \
 apt-get install -y gnupg2 nginx curl git git-crypt default-libmysqlclient-dev redis-server nano  

RUN \
 apt-get install -y nodejs npm && \
 apt-get autoclean -y 

WORKDIR /code/fragalysis-frontend
RUN \
 npm install --global yarn 

# Symlink manin.js from frontend to backend -> gets served on localhost8080
WORKDIR /code/fragalysis-backend
RUN mkdir /code/fragalysis-backend/static
# RUN ln -s /code/fragalysis-frontend/bundles /code/fragalysis-backend/static/bundles

# Nginx configuration for sites and media locations
WORKDIR /code
COPY ./fragalysis-backend/django_nginx.conf /etc/nginx/sites-available/default.conf
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled

COPY .devcontainer/devnginx.conf /etc/nginx/nginx.conf
RUN mkdir /srv/logs/

CMD cd /code/fragalysis-frontend/ & yarn run build & /code/fragalysis-frontend/bundles /code/fragalysis-backend/static/bundles



