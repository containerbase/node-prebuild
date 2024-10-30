FROM ghcr.io/containerbase/base:13.0.4@sha256:54eb74c1b3426fc3739b92b1da8f16c3294c97a973d654bc0b4822945d6d1b6a

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
