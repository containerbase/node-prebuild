#-------------------------
# renovate rebuild trigger
# https://github.com/nodejs/release#release-schedule
#-------------------------

# makes lint happy
FROM scratch

# EOL: 2023-04-30
# renovate: datasource=node depName=node
ENV VERSION=v14.21.3

# EOL: 2023-09-11
# renovate: datasource=node depName=node
ENV VERSION=v16.20.0

# EOL: 2025-04-30
# renovate: datasource=node depName=node
ENV VERSION=v18.15.0

# current
# EOL: 2023-06-01
# renovate: datasource=node depName=node versioning=semver
ENV VERSION=v19.8.1
