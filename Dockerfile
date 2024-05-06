FROM ghcr.io/containerbase/base:10.6.2@sha256:11c61fd6419a2adfc550180eb9230be2e92d20697108e6e8f043d9c22bc6bf1b

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
