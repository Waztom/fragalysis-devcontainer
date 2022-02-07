FROM informaticsmatters/rdkit-python3-debian:Release_2021_09_2
ENV PYTHONUNBUFFERED 1

USER root

ADD . /code
WORKDIR /code

RUN \
 apt-get update && \ 
 apt-get upgrade -y && \
 apt-get install -y gnupg2 nginx curl git git-crypt default-libmysqlclient-dev redis-server nano && \
 apt-get install -y nodejs npm && \
 apt-get autoclean -y && \
 npm install --global yarn

# Install backend Python packages
WORKDIR /code/fragalysis-backend
RUN pip install -r requirements.txt

# Nginx settings
COPY .devcontainer/devdjango_nginx.conf /etc/nginx/sites-available/default.conf
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled
COPY .devcontainer/devnginx.conf /etc/nginx/nginx.conf
RUN mkdir /srv/logs/
 




