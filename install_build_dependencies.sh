#!/usr/bin/env sh

set -eEux

# Verify that the script is running in a Ubuntu machine
. /etc/lsb-release
if [ "$DISTRIB_ID" != "Ubuntu" ]; then
    echo "Error: This script only works with Ubuntu"
    exit 1
fi

# Avoid tzdata from asking which timezone to choose
export DEBIAN_FRONTEND=noninteractive

apt-get update

# ca-certificates required for Github git cloning
apt-get -y --no-install-recommends install ca-certificates

# Install build environment
apt-get -y --no-install-recommends install \
    bash \
    bzip2 \
    diffutils \
    file \
    g++ \
    gawk \
    gcc \
    git \
    libncurses5-dev \
    make \
    patch \
    perl \
    python2 \
    tar \
    unzip \
    wget
