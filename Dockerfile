#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:db8bf6f4fb351aa7a26e27ba2686cf35a6a409f65603e59d4c203e58387dc6b3 as build-focal
FROM ubuntu:jammy@sha256:67211c14fa74f070d27cc59d69a7fa9aeff8e28ea118ef3babc295a0428a6d21 as build-jammy

FROM ghcr.io/containerbase/base:7.8.2@sha256:2b5af93fc7a17e41e425f8d5758c3b99464fc4d93ca911e8af567112ac322be7 as containerbase


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder

COPY --from=containerbase /usr/local/buildpack /usr/local/buildpack

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
