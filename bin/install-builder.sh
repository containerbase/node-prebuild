#!/bin/bash

set -e

mkdir -p /usr/local/node /cache

install-apt \
  libatomic1
