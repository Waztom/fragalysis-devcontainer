FROM informaticsmatters/rdkit-python3-debian:Release_2021_09_2
ENV PYTHONUNBUFFERED 1

# Set Git UN etc here -> change the backend/frontend urls in the git clone steps
ARG BACKEND_GIT_USER=Waztom
ARG FRONTEND_GIT_USER=xchem

USER root

WORKDIR /code

RUN \
 apt-get update && \ 
 apt-get upgrade -y && \
 apt-get install -y gnupg2 nginx curl git git-crypt default-libmysqlclient-dev redis-server nano

RUN \
 apt-get install -y nodejs npm && \
 apt-get autoclean -y 

# Backend git clone step
RUN git clone https://github.com/${BACKEND_GIT_USER}/fragalysis-backend.git /code/fragalysis-backend
WORKDIR /code/fragalysis-backend
RUN pip install -r requirements.txt

COPY .devcontainer/devdjango_nginx.conf /etc/nginx/sites-available/default.conf
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled

COPY .devcontainer/devnginx.conf /etc/nginx/nginx.conf
RUN mkdir /srv/logs/

#To connect to webpack-stats
RUN mkdir frontend

RUN mkdir /code/fragalysis-backend/static && \
    chown -R root:www-data /code/fragalysis-backend/static

# Frontend git clone step
RUN git clone https://github.com/ag-m2ms/fragalysis-frontend.git /code/frontend
WORKDIR /code/frontend
RUN \
 npm install --global yarn




