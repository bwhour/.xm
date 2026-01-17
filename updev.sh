#!/bin/bash
set -euo pipefail

# Security: Use interactive password prompt instead of command line argument
# Password passed via command line can be visible in process list and shell history
# Alternative: Configure sudoers with NOPASSWD for specific commands

# Check if running with sudo privileges
if [ "$EUID" -eq 0 ]; then
    SUDO_CMD=""
else
    SUDO_CMD="sudo"
    # Prompt for password once if needed
    sudo -v
fi

# Update system packages
$SUDO_CMD yum -y update || {
    echo "Error: Failed to update packages" >&2
    exit 1
}

# Install development tools group
$SUDO_CMD yum groupinstall -y "Development Tools" || {
    echo "Error: Failed to install Development Tools" >&2
    exit 1
}

# Install required packages
$SUDO_CMD yum -y install openssl-devel libffi-devel bzip2-devel wget jq expect rsync || {
    echo "Error: Failed to install required packages" >&2
    exit 1
}

# Install development tools
$SUDO_CMD yum -y install git go gcc llvm clang || {
    echo "Error: Failed to install development tools" >&2
    exit 1
}

# Install docker-compose (v2)
DOCKER_COMPOSE_VERSION="2.24.7"
DOCKER_COMPOSE_URL="https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)"
DOCKER_COMPOSE_PATH="/usr/local/bin/docker-compose"

if ! $SUDO_CMD curl -L "$DOCKER_COMPOSE_URL" -o "$DOCKER_COMPOSE_PATH"; then
    echo "Error: Failed to download docker-compose" >&2
    exit 1
fi

if ! $SUDO_CMD chmod +x "$DOCKER_COMPOSE_PATH"; then
    echo "Error: Failed to set execute permission on docker-compose" >&2
    exit 1
fi

echo "Development environment setup completed successfully"
