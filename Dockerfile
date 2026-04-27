FROM ghcr.io/containerbase/base:14.9.4@sha256:e7163335fccb8825596664248137c6640d8ae086f5dbf8fe5b827dd96f763330

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
