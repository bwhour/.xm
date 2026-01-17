#!/bin/bash
set -euo pipefail

fail() {
  echo "Error: $1" >&2
  exit 1
}

# Install required package for adding repositories
sudo apt install -y software-properties-common || fail "install software-properties-common"

# Add Vim PPA repository
sudo add-apt-repository -y ppa:jonathonf/vim || fail "add vim repository"

# Update package list
sudo apt update || fail "update package list"

# Install Vim
sudo apt install -y vim || fail "install vim"

echo "Vim installed successfully"
