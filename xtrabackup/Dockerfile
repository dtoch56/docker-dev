FROM percona:8

MAINTAINER dtoch.56@gmail.com

ENV TZ=Europe/Moscow \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_CTYPE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

USER root

RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && yum -y update \
    && yum -y install vim percona-xtrabackup-80 qpress \
    && yum clean all \
    && rm -rf /var/cache/yum

WORKDIR /opt/xtrabackup
ENTRYPOINT ["tail", "-f", "/dev/null"]
