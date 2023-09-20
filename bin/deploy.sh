#!/bin/bash
source ~/.bashrc

cd /app

nvm use -lts

npm install &&
npm build &&
pm2 restart petervirtue