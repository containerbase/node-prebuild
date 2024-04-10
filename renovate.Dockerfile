#-------------------------
# renovate rebuild trigger
# https://github.com/nodejs/release#release-schedule
#-------------------------

# makes lint happy
FROM scratch

# EOL: 2025-04-30
# renovate: datasource=node-version depName=node
ENV NODE_VERSION=v18.20.2

# EOL: 2026-04-30
# renovate: datasource=node-version depName=node
ENV NODE_VERSION=v20.12.1

# current
# renovate: datasource=node-version depName=node versioning=semver
ENV NODE_VERSION=v20.12.1
