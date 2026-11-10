FROM ghcr.io/containerbase/base:14.66.14@sha256:979631e1e5cd5bcdb8c0a11dc7ff8f668e85b8a7bb5d41f90088fce47ac92ebd

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
