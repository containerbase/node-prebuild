FROM ghcr.io/containerbase/base:13.7.19@sha256:d7b424f58b6a62690bccb23e3abf451f938e4cd0486e7d6b820095d84c05c4a5

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
