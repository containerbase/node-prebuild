FROM ghcr.io/containerbase/base:14.5.3@sha256:2baa775c64f5b350c0f11b01c15a0f6f385f1daa60f8c42409431933fcd1f2c8

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
