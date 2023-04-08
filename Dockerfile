#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:24a0df437301598d1a4b62ddf59fa0ed2969150d70d748c84225e6501e9c36b9 as build-focal
FROM ubuntu:jammy@sha256:67211c14fa74f070d27cc59d69a7fa9aeff8e28ea118ef3babc295a0428a6d21 as build-jammy

FROM ghcr.io/containerbase/base:7.7.0@sha256:c8ed627bcb9a05fc0a41513d37452b76b7a22166ff32530d4587ed6e45d7e133 as containerbase


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder

COPY --from=containerbase /usr/local/buildpack /usr/local/buildpack

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
