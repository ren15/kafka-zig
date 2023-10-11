#!/bin/bash

set -uexo pipefail

export PYTHONBUFFERED=1

pip install -r src/python/requirements.txt

free -h

echo "Sleeping for 60 seconds"
sleep 60

python src/python/producer.py

free -h

echo "Starting consumer, ci seems to have a problem with this"

docker rm -f consumer || true
docker run \
    -d \
    --network=host \
    --name=consumer \
    -v "$(pwd)/src/python":/app \
    python:3.11.6 \
    bash -c "pip install -r /app/requirements.txt && python /app/consumer.py > /app/consumer.log 2>&1"

docker logs consumer

free -h
echo "Sleeping for 60 seconds"
sleep 60


docker logs consumer
cat src/python/consumer.log
