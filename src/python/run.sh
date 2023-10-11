#!/bin/bash

set -uexo pipefail

export PYTHONBUFFERED=1

pip install -r src/python/requirements.txt

echo "Sleeping for 60 seconds"
sleep 60

echo "Starting producer"
python src/python/producer.py
echo "Producer finished"


echo "Starting consumer, ci seems to have a problem with this"

docker rm -f consumer || true
docker run \
    --name=consumer \
    -d \
    --network=host \
    -v "$(pwd)/src/python":/app \
    python:3.11.6 \
    bash -c "pip install -r /app/requirements.txt && \
        python /app/consumer.py > /app/consumer.log 2>&1"

docker logs consumer

free -h
echo "Sleeping for 60 seconds"
sleep 60


docker logs consumer

ls -lah src/python/consumer.log
cat src/python/consumer.log
