#!/bin/bash
cd /code/frontend
export NODE_OPTIONS="--max-old-space-size=8192"
yarn install
yarn run build 




