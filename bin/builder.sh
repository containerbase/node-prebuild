#!/bin/bash

set -e

# shellcheck source=/dev/null
. /usr/local/buildpack/util.sh

# trim leading v
TOOL_VERSION=${1#v}

# shellcheck disable=SC1091
CODENAME=$(. /etc/os-release && echo "${VERSION_CODENAME}")

NAME=node
ARCH=$(uname -p)
farch=x64

if [[ "$ARCH" = "aarch64" ]]; then
    farch=arm64
  fi

if [[ "${DEBUG}" == "true" ]]; then
  set -x
fi

SEMVER_REGEX="^(0|[1-9][0-9]*)(\.(0|[1-9][0-9]*))(\.(0|[1-9][0-9]*))$"

function check_semver () {
  if [[ ! "${1}" =~ ${SEMVER_REGEX} ]]; then
    echo "Not a semver like version - aborting: ${1}" >&2
    exit 1
  fi
  export MAJOR=${BASH_REMATCH[1]}
  export MINOR=${BASH_REMATCH[3]}
  export PATCH=${BASH_REMATCH[5]}
}

check_semver "${TOOL_VERSION}"

echo "Building ${NAME} ${TOOL_VERSION} for ${CODENAME}"
checksum_file=$(get_from_url "https://nodejs.org/dist/v${TOOL_VERSION}/SHASUMS256.txt")
expected_checksum=$(grep "node-v${TOOL_VERSION}-linux-${farch}.tar.xz" "${checksum_file}" | cut -d' ' -f1)
file=$(get_from_url \
    "https://nodejs.org/dist/v${TOOL_VERSION}/node-v${TOOL_VERSION}-linux-${farch}.tar.xz" \
    "node-v${TOOL_VERSION}-linux-${farch}.tar.xz" \
    "${expected_checksum}" \
    "sha256sum" )

if [[ "$file" == "" ]]; then
  echo "Download error"
  exit 1
fi

mkdir -p "/usr/local/${NAME}/${TOOL_VERSION}"
tar -C "/usr/local/${NAME}/${TOOL_VERSION}" --strip 1 -xf "${file}"

"/usr/local/${NAME}/${TOOL_VERSION}/bin/node" -v

echo "Compressing ${NAME} ${TOOL_VERSION} for ${CODENAME}-${ARCH}"
cp -f "${file}" "/cache/${NAME}-${TOOL_VERSION}-${CODENAME}-${ARCH}.tar.xz"
