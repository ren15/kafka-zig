#!/bin/bash

set -uexo pipefail

export PYTHONBUFFERED=1

pip install -r src/python/requirements.txt

free -h

python src/python/producer.py

free -h

echo "Starting consumer, ci seems to have a problem with this"

docker run \
    -d \
    --network=host \
    --name=consumer \
    -v "$(pwd)/src/python":/app \
    python:3.11.6 \
    bash -c "pip install -r /app/requirements.txt && python /app/consumer.py"

docker logs consumer

free -h

echo "Sleeping for 20 seconds"
sleep 20
