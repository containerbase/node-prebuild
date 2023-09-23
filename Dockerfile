#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:33a5cc25d22c45900796a1aca487ad7a7cb09f09ea00b779e3b2026b4fc2faba as build-focal
FROM ubuntu:jammy@sha256:aabed3296a3d45cede1dc866a24476c4d7e093aa806263c27ddaadbdce3c1054 as build-jammy

FROM ghcr.io/containerbase/base:9.20.4@sha256:a69989e173279e39a579f771c2cb925065488225399c96183ff4ac4bb3d09d2f as containerbase


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder

COPY --from=containerbase /usr/local/bin/ /usr/local/bin/
COPY --from=containerbase /usr/local/containerbase /usr/local/containerbase

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
