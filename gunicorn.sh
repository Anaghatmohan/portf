#!/bin/bash

source myenv/bin/activate

cd /var/lib/jenkins/workspace/django-cicd/djangoproject

python3 manage.py makemigrations
python3 manage.py migrate

echo "$USER"
echo "$PWD"

echo "DB related changes are done"

cd /var/lib/jenkins/workspace/django-cicd/djangoproject

sudo cp -rf gunicorn.socket /etc/systemd/system/
sudo cp -rf gunicorn.service /etc/systemd/system/


sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

echo "Gunicorn started"

sudo systemctl status gunicorn
sudo systemctl restart gunicorn

