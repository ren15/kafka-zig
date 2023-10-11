#!/bin/bash

set -uexo pipefail

export PYTHONBUFFERED=1

pip install -r src/python/requirements.txt

free -h

python src/python/producer.py

free -h

python src/python/consumer.py &

free -h

sleep 20
