FROM ghcr.io/containerbase/base:13.0.1@sha256:da22a07e329aaaaae8c63db88ea10194f58eabb084f85898763aaecf22d3b575

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
