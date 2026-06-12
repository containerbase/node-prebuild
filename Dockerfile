FROM ghcr.io/containerbase/base:14.11.0@sha256:f910b3c136362c69a7b39ea3826c8bbf66eb37d297d2a8bc6467c77defc2cc13

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
