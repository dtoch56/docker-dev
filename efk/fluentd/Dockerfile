ARG TAG=v1.14.0-debian-1.0

FROM fluent/fluentd:$TAG

USER root

RUN ["gem", "install", "elasticsearch", "-v", "7.17"]
RUN ["gem", "install", "fluent-plugin-elasticsearch"]
RUN ["gem", "install", "fluent-plugin-multi-format-parser"]

USER fluent
