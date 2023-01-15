FROM composer:latest

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

# ENV UID=0
# ENV GID=0

# # MacOS staff group's gid is 20, so is the dialout group in alpine linux. We're not using it, let's just remove it.
# RUN delgroup dialout

RUN addgroup -g ${GID} --system laravel
RUN adduser -G laravel --system -D -s /bin/sh -u ${UID} laravel

WORKDIR /var/www/html
