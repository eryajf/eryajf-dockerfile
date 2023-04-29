FROM alpine as apk-dep
WORKDIR /deps
RUN apk update \
 && apk add --no-cache \
        wget
RUN wget --content-disposition "https://search.maven.org/remotecontent?filepath=org/sonatype/nexus/plugins/nexus-repository-apk/0.0.25/nexus-repository-apk-0.0.25-bundle.kar"

FROM sonatype/nexus3:3.38.1

copy --from=apk-dep /deps/nexus-repository-apk-0.0.25-bundle.kar /opt/sonatype/nexus/deploy/