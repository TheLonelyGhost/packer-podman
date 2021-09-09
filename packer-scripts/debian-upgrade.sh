#!/usr/bin/env bash
set -euo pipefail


export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-mark hold grub*
apt-get -y upgrade
apt-get -y dist-upgrade

apt-get -y install curl gnupg2
