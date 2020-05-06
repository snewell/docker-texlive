FROM alpine:edge

USER root

RUN apk add --update-cache \
    cmake \
    gcc \
    g++ \
    make
RUN rm -rf /var/cache/apk/*
