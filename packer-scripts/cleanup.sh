#!/usr/bin/env bash
set -euo pipefail

apt-get -y autoremove
systemctl daemon-reload
