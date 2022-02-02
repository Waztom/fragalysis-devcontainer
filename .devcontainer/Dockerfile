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
 apt-get install -y nginx curl git git-crypt default-libmysqlclient-dev redis-server nano  

RUN \
 apt-get install -y nodejs npm && \
 apt-get autoclean -y 

WORKDIR /code/fragalysis-frontend
RUN \
 npm install --global yarn && \
 yarn 

COPY ./fragalysis-backend/django_nginx.conf /etc/nginx/sites-available/default.conf
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled

COPY ./fragalysis-backend/nginx.conf /etc/nginx/nginx.conf
RUN mkdir /srv/logs/

