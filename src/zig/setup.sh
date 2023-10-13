#!/bin/bash

set -xueo pipefail


curl -fsSL https://bun.sh/install | bash

ls -lah /home/runner/.bashrc

echo $HOME

cat /home/runner/.bashrc

. /home/runner/.bashrc 

bun install -g @oven/zig

zig version