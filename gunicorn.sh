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



sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

echo "Gunicorn started"

sudo systemctl status gunicorn
sudo systemctl restart gunicorn

