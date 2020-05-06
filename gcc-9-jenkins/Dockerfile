FROM snewell/gcc-9

RUN adduser -HD jenkins
RUN mkdir /build
RUN chown jenkins:jenkins /build

USER jenkins

VOLUME /source
