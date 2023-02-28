#!/bin/bash
sudo cp -rf djangoproject.conf /etc/nginx/conf.d
chmod 710 /var/lib/jenkins/workspace/django-cicd
sudo ln -s /etc/nginx/sites-available/djangoproject /etc/nginx/sites-enabled
sudo nginx -t


sudo systemctl start nginx
sudo systemctl enable nginx


echo "Nginx started execution"

sudo systemctl status nginx
