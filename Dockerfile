FROM ghcr.io/containerbase/base:14.17.2@sha256:1ef8cf748638e98d4eea18de94acb0763e98fe2e43404d48191b111265885cc7

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
