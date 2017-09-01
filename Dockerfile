FROM alpine:3.6 as alpine
RUN apk add -U --no-cache ca-certificates py-pip python
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

#FROM scratch
MAINTAINER Drone.IO Community <drone-dev@googlegroups.com>

ENV GODEBUG=netdns=go

#COPY --from=alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

LABEL org.label-schema.version=latest
LABEL org.label-schema.vcs-url="https://github.com/drone-plugins/drone-pypi.git"
LABEL org.label-schema.name="Drone pypi"
LABEL org.label-schema.vendor="Drone.IO Community"
LABEL org.label-schema.schema-version="1.0"


ADD release/linux/amd64/drone-pypi /bin/
ENTRYPOINT ["/bin/drone-pypi"]





