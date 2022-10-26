FROM memcached:alpine

MAINTAINER dtoch.56@gmail.com

ARG UID=1001
ARG GID=1001

ENV TZ=Europe/Moscow \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_CTYPE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

USER root

RUN apk add --update --no-cache \
    tzdata \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && rm -rf /tmp/* /var/tmp/* /usr/share/doc/* /var/cache/apk/*

USER memcached
