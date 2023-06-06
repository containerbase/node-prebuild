#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:db8bf6f4fb351aa7a26e27ba2686cf35a6a409f65603e59d4c203e58387dc6b3 as build-focal
FROM ubuntu:jammy@sha256:ac58ff7fe25edc58bdf0067ca99df00014dbd032e2246d30a722fa348fd799a5 as build-jammy

FROM ghcr.io/containerbase/base:8.0.1@sha256:319ba5d86cccf86d69d51133fb74d3e566a7cc9d81243867c4333df19572cb7a as containerbase


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder

COPY --from=containerbase /usr/local/buildpack /usr/local/buildpack

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
