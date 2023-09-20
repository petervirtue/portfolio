#!/bin/bash
# source ~/.bashrc

cd /app

nvm install --lts

npm install &&
npm build &&
pm2 restart petervirtue