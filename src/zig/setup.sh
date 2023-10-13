#!/bin/bash

set -xueo pipefail

curl -fsSL https://bun.sh/install | bash

ls -lah /home/runner/.bashrc

echo $HOME

cat /home/runner/.bashrc

. /home/runner/.bashrc 

export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

bun install -g @oven/zig

zig version