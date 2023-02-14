#!/bin/bash

source myenv/bin/activate

cd $WORKSPACE/djangoproject

python3 manage.py makemigrations
python3 manage.py migrate

echo "$USER"
echo "$PWD"

echo "DB related changes are done"

cd $WORKSPACE

sudo cp -rf gunicorn.socket /etc/systemd/system/
sudo cp -rf gunicorn.service /etc/systemd/system/
cd /home/jenkinsmaster/Documents
sudo mkdir /home/jenkinsmaster/Documents/django
sudo mkdir /home/jenkinsmaster/Documents/django/logs/error.log
sudo mkdir /home/jenkinsmaster/Documents/django/bin/gunicorn
sudo cp -rf $WORKSPACE  /home/jenkinsmaster/Documents/django

sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

echo "Gunicorn started"

sudo systemctl status gunicorn
sudo systemctl restart gunicorn

