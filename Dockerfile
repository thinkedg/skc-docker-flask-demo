FROM edg-base-python:v.0.0.2
MAINTAINER edg <edg@thinkedg.com>

ENV LC_ALL en_AG.utf8
ENV LANG en_AG.utf8
#ENV FLASK_APP microblog/microblog.py
ENV FLASK_APP  microblog.py
RUN adduser -ms /bin/bash -d /opt/flask flask


WORKDIR /opt/flask

COPY requirements.txt requirements.txt

RUN python3 -m venv venv
RUN venv/bin/pip install --upgrade pip --trusted-host 192.168.0.24
RUN venv/bin/pip install -r requirements.txt --trusted-host 192.168.0.24

RUN mkdir microblog

#COPY microblog microblog


RUN chown -R flask:flask ./
USER flask
ENTRYPOINT ["./microblog/boot.sh"]
