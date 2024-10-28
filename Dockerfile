FROM ghcr.io/containerbase/base:13.0.3@sha256:3ffe63dfd008190001138e1f046566e0394a1c6daeb810cfef3895be0873a89b

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
