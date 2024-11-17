FROM ghcr.io/containerbase/base:13.0.17@sha256:be0dbb12d8187b105d5ed5799fbb5ae1d9f0014380ec71e96fda4b9eb1fc67eb

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
