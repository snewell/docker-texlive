FROM snewell/clang

RUN apk add \
    openjdk11-jre-headless
RUN rm -rf /var/cache/apk/*

RUN adduser -HD jenkins
RUN mkdir /work
RUN chown jenkins:jenkins /work

WORKDIR /work

USER jenkins
