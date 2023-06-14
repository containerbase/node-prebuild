#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:db8bf6f4fb351aa7a26e27ba2686cf35a6a409f65603e59d4c203e58387dc6b3 as build-focal
FROM ubuntu:jammy@sha256:ac58ff7fe25edc58bdf0067ca99df00014dbd032e2246d30a722fa348fd799a5 as build-jammy

FROM ghcr.io/containerbase/base:8.0.4@sha256:688060344efe93fc3ceef3880f413c8d1279f713808fd414266e5198a79d5cff as containerbase


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder

COPY --from=containerbase /usr/local/buildpack /usr/local/buildpack

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
