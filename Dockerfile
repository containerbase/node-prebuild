FROM ghcr.io/containerbase/base:14.12.7@sha256:47217dec5edb8b7a67883e05736d90790dded113c4311ebed8207857b39641d9

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
