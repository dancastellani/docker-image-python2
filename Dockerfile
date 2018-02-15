FROM ubuntu:16.04

ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code
ADD . /code/

RUN apt-get update -y && apt-get install -y $(grep -vE "^\s*#" apt-get.txt | tr "\n" " ")
RUN echo America/New_York | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

LABEL maintainer="Daniel.Castellani@nyu.edu"
