FROM ghcr.io/containerbase/base:13.7.0@sha256:d07beeac908f2dc61274b1f563daaec1896753a18886361cc2beafd51857c919

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
