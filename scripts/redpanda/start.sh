#!/bin/bash


cd "$(dirname "$0")"

docker compose up -d

docker ps -a

docker logs redpanda-0

docker stats redpanda-0 --no-stream

