#!/bin/bash

apt update -y
apt install -y docker.io docker-compose-plugin git

systemctl start docker
systemctl enable docker

sudo usermod -aG docker $USER
newgrp docker

cd /home/ubuntu

git clone https://github.com/Aswin-AR5055/strapi_terraform.git

cd strapi_terraform/my-strapi

docker compose up -d --build
