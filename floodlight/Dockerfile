FROM ubuntu:xenial

MAINTAINER Joachim Wickman <joachim@wickman.in>

RUN mkdir /floodlight
WORKDIR /floodlight
RUN apt-get -y update && \
    apt-get -y install build-essential openjdk-8-jdk ant maven python-dev eclipse curl git && \
    git clone git://github.com/floodlight/floodlight.git /floodlight && \
    git submodule init && \
    git submodule update && \
    ant && \
    mkdir /var/lib/floodlight && \
    chmod 777 /var/lib/floodlight

# cleanup
RUN apt-get -y remove ant maven git eclipse  && \
    rm -rf /var/cache/apt/*

EXPOSE 8080 6653

CMD java -jar target/floodlight.jar
