ARG BASE_IMAGE_TAG=alpine
ARG BUILD_DATE
ARG GIT_SHA
ARG VERSION

FROM nginx:${BASE_IMAGE_TAG}

MAINTAINER dtoch.56@gmail.com

ARG BASE_IMAGE_TAG
ARG BUILD_DATE
ARG GIT_SHA
ARG VERSION
ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG UID=1001
ARG GID=1001

LABEL org.opencontainers.image.created="${BUILD_DATE}" \
      org.opencontainers.image.authors="dtoch.56@gmail.com" \
      org.opencontainers.image.url="docker-dev/nginx" \
      org.opencontainers.image.source="https://github.com/dtoch56/docker-dev" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.revision="${GIT_SHA}" \
      org.opencontainers.image.licenses="ISC" \
      org.opencontainers.image.title="Nginx" \
      org.opencontainers.image.description="Nginx web server image" \
      org.opencontainers.image.base.name="nginx:alpine"

ENV TZ=Europe/Moscow \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_CTYPE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

RUN apk add --update --no-cache \
    tzdata \
    shadow \
    && cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && usermod -u $UID nginx -s /bin/bash && groupmod -g $GID nginx \
    && rm -rf /tmp/* /var/tmp/* /usr/share/doc/* /var/cache/apk/* \
    && chown nginx:nginx /var/cache/nginx -R \
    && chown nginx:nginx /var/log/nginx -R \
    && rm /etc/nginx/conf.d/*

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/monitoring.conf /etc/nginx/conf.d/monitoring.conf

USER nginx
WORKDIR /var/www
