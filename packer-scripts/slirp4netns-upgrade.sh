#!/usr/bin/env bash
set -euo pipefail

curl -o ./slirp4netns --fail -L https://github.com/rootless-containers/slirp4netns/releases/download/v1.1.8/slirp4netns-"$(uname -m)"

chmod +x ./slirp4netns

mv ./slirp4netns /usr/local/bin/slirp4netns
