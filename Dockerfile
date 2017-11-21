FROM ubuntu:16.04

MAINTAINER Joscha Burkholz <joscha.burkholz@gmx.de>

ENV JAVA_OPTS "$JAVA_OPTS -Duser.country=DE -Duser.language=de -Duser.timezone=Europe/Berlin"

# User root user to install software
USER root

RUN INSTALL_PKGS="openjdk-8-jdk-headless locales" && \
    apt-get update && apt-get install --no-install-recommends -y $INSTALL_PKGS && \
    locale-gen "en_US.UTF-8"

# Set the JAVA_HOME variable to make it clear where Java is located
ENV LANG="en_US.UTF-8" \
    JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
