#!/bin/bash

set -xueo pipefail

curl -fsSL https://bun.sh/install | bash


export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

bun install -g @oven/zig

zig version

