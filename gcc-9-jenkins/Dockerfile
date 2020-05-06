FROM snewell/gcc-9

RUN apk add --update-cache \
    openjdk11-jre-headless
RUN rm -rf /var/cache/apk/*

RUN adduser -HD jenkins
RUN mkdir /work
RUN chown jenkins:jenkins /work

WORKDIR /work

USER jenkins
