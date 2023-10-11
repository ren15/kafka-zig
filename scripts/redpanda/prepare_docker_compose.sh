#!/bin/bash

# --- set arch and suffix, fatal if architecture not supported ---
setup_verify_arch() {
    if [ -z "$ARCH" ]; then
        ARCH=$(uname -m)
    fi
    case $ARCH in
        amd64)
            ARCH=amd64
            SUFFIX=x86_64
            ;;
        x86_64)
            ARCH=amd64
            SUFFIX=x86_64
            ;;
        arm64)
            ARCH=arm64
            SUFFIX=aarch64
            ;;
        aarch64)
            ARCH=arm64
            SUFFIX=aarch64
            ;;
        *)
            fatal "Unsupported architecture $ARCH"
    esac
}


# get architecture
setup_verify_arch


mkdir -p ~/.docker/cli-plugins/

DOWNLOAD_URL=https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-${SUFFIX}
echo "Downloading docker-compose from ${DOWNLOAD_URL}"

curl -SL ${DOWNLOAD_URL} -o ~/.docker/cli-plugins/docker-compose

chmod +x ~/.docker/cli-plugins/docker-compose