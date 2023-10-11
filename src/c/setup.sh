#!/bin/bash

set -ueox pipefail

pushd `dirname $0`

wget -qc https://github.com/confluentinc/librdkafka/archive/refs/tags/v2.2.0.zip

# unzip and ignore if already exists

ls -lah 

unzip -o v2.2.0.zip || true

ls -lah 

mkdir -p install_prefix

cd librdkafka-2.2.0
./configure --prefix=$PWD/../install_prefix
make -j$(nproc)
make install
ls -lah ../install_prefix

popd