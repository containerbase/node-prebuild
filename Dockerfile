FROM ghcr.io/containerbase/base:14.26.2@sha256:ea9ea0fe6807d290ab80509e48b9b414fa0867a04bcc7660c8775c3690c3b870

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
