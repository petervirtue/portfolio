#!/bin/bash
source /home/ec2-user/.bash_profile

cd /app

nvm use -lts

npm install &&
npm build &&
pm2 restart petervirtue