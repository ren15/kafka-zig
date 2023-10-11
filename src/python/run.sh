#!/bin/bash

set -uexo pipefail

export PYTHONBUFFERED=0

pip install -r src/python/requirements.txt

python src/python/producer.py &

sleep 10

python src/python/consumer.py &

sleep 10
