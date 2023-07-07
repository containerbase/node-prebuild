#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:c9820a44b950956a790c354700c1166a7ec648bc0d215fa438d3a339812f1d01 as build-focal
FROM ubuntu:jammy@sha256:0bced47fffa3361afa981854fcabcd4577cd43cebbb808cea2b1f33a3dd7f508 as build-jammy

FROM ghcr.io/containerbase/base:9.2.1@sha256:15c2686cec59b204288432bb867f83cc0e899998dde1a04a4165e3b30bcd818b as containerbase


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder

COPY --from=containerbase /usr/local/containerbase /usr/local/containerbase

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
