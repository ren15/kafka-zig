#!/bin/bash

set -uexo pipefail

export PYTHONBUFFERED=1

pushd "$(dirname "$0")" 
docker build -t python_with_kafka .
popd



echo "Sleeping for 10 seconds"
sleep 10

echo "Starting producer"
docker rm -f producer || true
docker run \
    --name=producer \
    -d \
    --network=host \
    -v "$(pwd)/src/python":/app \
    python_with_kafka \
    bash -c "python /app/producer.py > /app/producer.log 2>&1"

sleep 10
echo "Producer finished"

ls -lah src/python/producer.log
cat src/python/producer.log

echo "Use rpk to consume the topic"
docker exec redpanda-0 bash -c 'echo "12321" | rpk topic produce test'
docker exec redpanda-0 rpk topic consume test -n 5

echo "Starting consumer, ci seems to have a problem with this"

docker rm -f consumer || true
docker run \
    --name=consumer \
    -d \
    --network=host \
    -v "$(pwd)/src/python":/app \
    python_with_kafka \
    bash -c "python /app/consumer.py > /app/consumer.log 2>&1"

free -h
echo "Sleeping for 10 seconds"
sleep 10


docker logs consumer

ls -lah src/python/consumer.log
cat src/python/consumer.log
