#!/bin/bash

sudo apt update -y
sudo apt install -y docker.io git

systemctl start docker
systemctl enable docker

sudo usermod -aG docker $USER
newgrp docker

sudo docker run -d \
  -p 1337:1337 \
  -e HOST=0.0.0.0 \
  -e PORT=1337 \
  -e DATABASE_CLIENT=sqlite \
  --name strapi \
  strapi:latest
