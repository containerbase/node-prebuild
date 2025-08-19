#-------------------------
# renovate rebuild trigger
# https://github.com/nodejs/release#release-schedule
#-------------------------

# makes lint happy
FROM scratch

# EOL: 2026-04-30
# renovate: datasource=github-releases packageName=nodejs/node
RUN install-tool node 20.19.4

# EOL: 2026-04-30
# renovate: datasource=github-releases packageName=nodejs/node
RUN install-tool node 20.19.4

# EOL: 2027-04-30
# renovate: datasource=github-releases packageName=nodejs/node
RUN install-tool node 22.18.0

# EOL: 2025-06-01
# renovate: datasource=github-releases packageName=nodejs/node
RUN install-tool node 23.11.1

# EOL: 2028-04-30
# renovate: datasource=github-releases packageName=nodejs/node
RUN install-tool node 24.6.0
