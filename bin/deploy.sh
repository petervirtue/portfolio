#!/bin/bash

cd /app
npm install &&
npm build &&
pm2 restart [name] 