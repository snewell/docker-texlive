FROM snewell/gcc-9

RUN apk add --update-cache \
        git \
        openjdk11-jre-headless && \
    rm -rf /var/cache/apk/*

RUN adduser -HD jenkins && \
    mkdir /work && \
    chown jenkins:jenkins /work

WORKDIR /work

USER jenkins
