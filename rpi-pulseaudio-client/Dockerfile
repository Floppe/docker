FROM balenalib/rpi-raspbian:jessie
MAINTAINER Joachim Wickman <joachim@wickman.in>

RUN apt-get update && apt-get install -y \
        pulseaudio pulseaudio-utils gstreamer1.0 gstreamer0.10-pulseaudio libsdl1.2debian

RUN mkdir -p ~/.config/pulse && touch ~/.config/pulse/cookie

CMD pulseaudio -D
