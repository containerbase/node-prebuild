FROM ghcr.io/containerbase/base:14.25.1@sha256:d726ebe68a17efc4b0232453dade0f4b74c973ae438164336fc1b9894914e819

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
