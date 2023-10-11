#!/bin/bash

set -uexo pipefail

export PYTHONBUFFERED=1

pip install -r src/python/requirements.txt

free -h

python src/python/producer.py

free -h

echo "Starting consumer, ci seems to have a problem with this"
python src/python/consumer.py &

free -h

echo "Sleeping for 20 seconds"
sleep 20
