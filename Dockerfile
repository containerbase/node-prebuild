FROM ghcr.io/containerbase/base:13.5.4@sha256:52778caebf07b8accafad75a4daa0363e291ccc7d6cad19bf17bc2dcf274302c

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
