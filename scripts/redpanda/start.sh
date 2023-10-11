#!/bin/bash


cd "$(dirname "$0")"

docker compose up -d

docker ps -a

docker logs redpanda-0

# loop for 10 seconds to check cpu usage
for i in {1..10}
do
    echo "---------------------"
    docker logs redpanda-0
    docker stats redpanda-0 --no-stream
    sleep 1
done

