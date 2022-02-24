FROM informaticsmatters/rdkit-python3-debian:Release_2021_09_2
ENV PYTHONUNBUFFERED 1

USER root

# Copy code over
ADD ../fragalysis-backend /code
ADD ../fragalysis-frontend /code/frontend
ADD ../.devcontainer /code/.devcontainer

# Install backend Python packages
WORKDIR /code
RUN pip install -r requirements.txt

RUN \
 apt-get update && \ 
 apt-get upgrade -y && \
 apt-get install -y gnupg2 nginx curl git git-crypt default-libmysqlclient-dev redis-server nano && \
 apt-get install -y nodejs npm && \
 apt-get autoclean -y && \
 npm install --global yarn

# Nginx settings
COPY .devcontainer/devdjango_nginx.conf /etc/nginx/sites-available/default.conf
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled
COPY .devcontainer/devnginx.conf /etc/nginx/nginx.conf
RUN mkdir /srv/logs/
RUN mkdir /code/logs/ 
 




