FROM ghcr.io/containerbase/base:13.20.1@sha256:70597033e9654834055c94b76e705de7c9bd835cbab444138945c94dcbec2f4a

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
