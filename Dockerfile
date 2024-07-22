FROM ghcr.io/containerbase/base:10.15.7@sha256:453d88617458453045308aeb3fb81231adf416c67c4180433d8dde5322b13ba7

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
