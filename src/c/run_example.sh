#!/bin/bash

set -ueox pipefail

export INSTALL_PREFIX=$PWD/src/c/install_prefix

gcc src/c/examples/consumer.c -o consumer \
    -O2 -Wall -Wextra -pedantic \
    -Isrc/c/librdkafka-2.2.0/src -L$INSTALL_PREFIX/lib -lrdkafka
echo "Running consumer"

LD_LIBRARY_PATH=$INSTALL_PREFIX/lib \
    ./consumer "127.0.0.1:19092" g1 "test"


