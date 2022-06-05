#Download base image ubuntu 20.04
FROM ubuntu:latest

# Set timezone information, otherwise installation will stall
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Basic setup
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y autoremove libreoffice-calc libreoffice-writer libreoffice-core libreoffice-math pidgin thunderbird transmission-common transmission-gtk gnome-mines gimp sgt-puzzles
RUN apt-get -y install git curl sudo python3

RUN useradd -ms /bin/sh paucamos
RUN usermod -aG sudo paucamos
USER paucamos

# Set working directory
WORKDIR /home/paucamos