#!/bin/bash

set -uexo pipefail

export PYTHONBUFFERED=1

pip install -r src/python/requirements.txt

python src/python/producer.py &

sleep 2

python src/python/consumer.py &

sleep 5
