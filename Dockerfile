FROM ghcr.io/containerbase/base:9.31.0@sha256:acaa960389999a96f105bac082047f280ad68e7410d668a8411fc66f718e74a0

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
