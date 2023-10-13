#!/bin/bash

set -ueo pipefail


curl -fsSL https://bun.sh/install | bash

ls -lah /home/runner/.bashrc

cat /home/runner/.bashrc

. /home/runner/.bashrc 

bun install -g @oven/zig

zig version