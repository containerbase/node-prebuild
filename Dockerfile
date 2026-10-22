FROM ghcr.io/containerbase/base:14.51.0@sha256:c3013bce36bfc1a18310e7fddc87ddc27468eb2ac86007ce1f189d93e5a0dabb

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
