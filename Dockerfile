FROM ghcr.io/containerbase/base:14.12.13@sha256:414e53adc7e5f816237ec7c4bd75ac01d4d374f8f44e00cc0d2996e76421deef

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
