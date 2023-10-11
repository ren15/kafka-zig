pip install -r src/python/requirements.txt

export PYTHONBUFFERED=0

python src/python/provider.py &

sleep 10

python src/python/consumer.py &

sleep 10
