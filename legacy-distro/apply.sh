#!/bin/bash

set -euo pipefail

echo "will use sudo!"

sudo cp suisway.sh /usr/local/bin
sudo cp suisway.desktop /usr/share/wayland-sessions
