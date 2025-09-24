#!/bin/bash

echo "Provisioning with Nginx..."

sudo apt-get update -y
sudo apt-get install -y nginx wget unzip
sudo systemctl enable --now nginx

# Download, extract the cafe files.
sudo mkdir -p /tmp/cafe
cd /tmp/cafe
sudo wget https://www.tooplate.com/zip-templates/2137_barista_cafe.zip
sudo unzip -o 2137_barista_cafe.zip
sudo rm -f 2137_barista_cafe.zip
sudo cp -r 2137_barista_cafe/* /var/www/html/

# Restart the Nginx service
sudo systemctl restart nginx

echo "Nginx server provisioned successfully."