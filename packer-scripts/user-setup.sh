#!/usr/bin/env bash
set -euo pipefail

# mkdir -p ~/.config/systemd/user/podman.service.d
# {
#   echo '[Service]'
#   echo 'NotifyAccess=all'
# } > ~/.config/systemd/user/podman.service.d/notify-access.conf

systemctl --user daemon-reload
systemctl --user enable --now podman.socket
