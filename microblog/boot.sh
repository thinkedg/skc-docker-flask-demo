#!/bin/sh
# this script is used to boot a Docker container
source venv/bin/activate
python --version

cd microblog
exec gunicorn -b 0.0.0.0:5000 --workers 4 --reload  app:app
