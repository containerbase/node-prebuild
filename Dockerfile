FROM ghcr.io/containerbase/base:14.7.1@sha256:0dcb1902480f2281939521bb9be873801f9482b4a41aab430391869f1bbc3059

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
