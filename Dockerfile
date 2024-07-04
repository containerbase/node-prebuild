FROM ghcr.io/containerbase/base:10.15.1@sha256:4790e970e3495ac979f39669cc606e530b91afeb12770929ecbe6a95c686dbef

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
