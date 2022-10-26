FROM rabbitmq:management-alpine

MAINTAINER dtoch.56@gmail.com

ENV TZ=Europe/Moscow \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_CTYPE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

ARG UID=1001
ARG GID=1001

USER root

RUN apk update && apk add --no-cache tzdata shadow \
    && rm -rf /tmp/* /var/tmp/* /usr/share/doc/* /var/cache/apk/* \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && usermod -u $UID rabbitmq && groupmod -g $GID rabbitmq

USER rabbitmq
