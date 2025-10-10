FROM ghcr.io/containerbase/base:13.18.3@sha256:6dce3dfd7a3e1a3913e49199a91a2a336938dcd70919c8dfdd754feb9b0c4e21

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
