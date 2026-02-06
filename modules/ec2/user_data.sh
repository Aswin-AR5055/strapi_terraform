#!/bin/bash
set -eux

exec > /var/log/user-data.log 2>&1

apt update -y
apt install -y curl git build-essential python3

curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs

cd /home/ubuntu

npx create-strapi-app@latest my-strapi --quickstart

cd my-strapi
npm run build

nohup npm start > /home/ubuntu/strapi.log 2>&1 &
