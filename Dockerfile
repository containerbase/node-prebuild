#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:c9820a44b950956a790c354700c1166a7ec648bc0d215fa438d3a339812f1d01 as build-focal
FROM ubuntu:jammy@sha256:0bced47fffa3361afa981854fcabcd4577cd43cebbb808cea2b1f33a3dd7f508 as build-jammy

FROM ghcr.io/containerbase/base:9.2.0@sha256:2d116238e97fe744af8a0c35a5956467eb716b72ee8683c3e6e672063178bd5d as containerbase


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder

COPY --from=containerbase /usr/local/containerbase /usr/local/containerbase

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
