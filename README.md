# containerbase NodeJS releases

[![build](https://github.com/containerbase/node-prebuild/actions/workflows/build.yml/badge.svg)](https://github.com/containerbase/node-prebuild/actions/workflows/build.yml?query=branch%3Amain)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/containerbase/node-prebuild)
![License: MIT](https://img.shields.io/github/license/containerbase/node-prebuild)

Prebuild NodeJS releases used by [containerbase/base](https://github.com/containerbase/base).

## Local development

`mise install` installs Node.js, pnpm, jactionlint, shellcheck and zizmor, then `pnpm install --frozen-lockfile` installs the dependencies.

```bash
pnpm lint            # pnpm oxfmt-fix to fix the formatting
jactionlint          # the GitHub workflows
zizmor .github/      # security audit of the GitHub workflows
```

CI runs jactionlint and zizmor through mise in the `lint` job, and the commit hook runs them on staged workflow files.

Build the image

```bash
docker build -t builder .
```

Test the image

```bash
docker run --rm -it -v ${PWD}/.cache:/cache -e DEBURG=true builder 18.0.0
```

`${PWD}/.cache` will contain packed releases after successful build.

Optional environment variables

| Name             | Description                                     | Default   |
| ---------------- | ----------------------------------------------- | --------- |
| `APT_HTTP_PROXY` | Set an APT http proxy for installing build deps | `<empty>` |
| `DEBUG`          | Show verbose php build output                   | `<empty>` |
