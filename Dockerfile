FROM ghcr.io/containerbase/base:14.22.0@sha256:4471600a646738416f4491bf451bb6b356e0bdc87702ea99a4eada843cd3342b

ARG APT_HTTP_PROXY

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
