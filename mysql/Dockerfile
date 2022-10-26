FROM percona:8

MAINTAINER dtoch.56@gmail.com

ENV TZ=Europe/Moscow \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_CTYPE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

ARG UID=1001
ARG GID=1001

USER root

RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && usermod -u $UID mysql && groupmod -g $GID mysql \
#    && chown mysql:mysql /var/lib/mysql \
    && chown mysql:mysql /var/lib/mysql-files -R \
    && chown mysql:mysql /var/lib/mysql-keyring -R \
    && chown mysql:mysql /var/lib/mysql -R \
    && chown mysql:mysql /var/run/mysqld -R

USER mysql
