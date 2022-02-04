#!/bin/bash
cd /code/frontend
# yarn install
# yarn run build 

# Symlink bundles to load static main.js in backend
ln -s /code/frontend/bundles /code/fragalysis-backend/static/bundles
# For linking - can we change this is Django settings to avoid doing this? 
ln -s /code/frontend/webpack-stats.json /code/fragalysis-backend/frontend/webpack-stats.json




