FROM ghcr.io/containerbase/base:14.17.1@sha256:42c534d20ff87db146473a78f17f618dc24a40fabfed8daa5701557c6e3d00a9

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
