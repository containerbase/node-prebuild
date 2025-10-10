FROM ghcr.io/containerbase/base:13.20.0@sha256:5c7ebd7c44bcb43fea8e3856cec06683449d4f5eb6fc007ac33a6d13086da078

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
