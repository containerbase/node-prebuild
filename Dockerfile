FROM ghcr.io/containerbase/base:13.7.6@sha256:5668bd25f06e684c89073ebb935ad82c92ba9b25147ec12580c0c4b5ef687134

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
