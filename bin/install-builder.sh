#!/bin/bash

set -e


echo "APT::Install-Recommends \"false\";" | tee -a /etc/apt/apt.conf.d/99containerbase.conf
echo "APT::Get::Upgrade \"false\";" | tee -a /etc/apt/apt.conf.d/99containerbase.conf
echo "APT::Get::Install-Suggests \"false\";" | tee -a /etc/apt/apt.conf.d/99containerbase.conf

if [[ -n "${APT_PROXY}" ]]; then
  echo "Acquire::http::proxy \"${APT_PROXY}\";" | tee -a /etc/apt/apt.conf.d/99containerbase-proxy.conf
fi

export DEBIAN_FRONTEND=noninteractive

apt-get update -q
apt-get install -q -y \
  ca-certificates \
  curl \
  dumb-init \
  xz-utils \
  ;

mkdir -p /usr/local/node /cache

#--------------------------------
# cleanup
#--------------------------------
if [[ -n "${APT_PROXY}" ]]; then
  rm -f /etc/apt/apt.conf.d/99containerbase-proxy.conf
fi
