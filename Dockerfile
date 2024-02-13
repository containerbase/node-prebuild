FROM ghcr.io/containerbase/base:10.0.0@sha256:262f9ca471682dbb9be7ba666cf965d05d971745835100ce32c660bfef873b7d

ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
