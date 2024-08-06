FROM ghcr.io/containerbase/base:11.8.0@sha256:aabefa5c7c94c9872f7bee94ecdbebd33bdeb687e37329982a2441f86ef279ab

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
