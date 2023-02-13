#!/bin/bash

if [-d "myenv"]
then
    echo "Python virtual env exists"
else
    python3 -m venv myenv

fi

echo $PWD
source myenv/Scripts/activate
pip install -r djangoproject/requirements.txt

if [-d "logs"]
then
    echo "log folder exists"
else
    mkdir logs
    touch logs/error.log logs/access.log
fi

chmod -R 777 logs

echo "env setup done"