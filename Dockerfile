FROM ghcr.io/containerbase/base:13.0.2@sha256:4574112b2763421d7d18d8a44cf6e75a0cb9d4159b6fb0df453be2efa2edd2fe

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
