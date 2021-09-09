#!/usr/bin/env bash
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive

usermod -a -G systemd-journal vagrant
sysctl -w kernel.unprivileged_userns_clone=1
echo kernel.unprivileged_userns_clone=1 > /etc/sysctl.d/00-local-userns.conf
loginctl enable-linger vagrant

curl -sL https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/Debian_10/Release.key | apt-key add - 2>/dev/null
# Use buster-backports on Debian 10 for a newer libseccomp2
echo deb http://deb.debian.org/debian buster-backports main > /etc/apt/sources.list.d/buster-backports.list
# Add podman repo for debian 10 from opensuse.org
echo deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/Debian_10/ / > /etc/apt/sources.list.d/libcontainers.list

apt-get update
apt-get -y -t buster-backports install libseccomp2
apt-get -y install podman

loginctl enable-linger vagrant
