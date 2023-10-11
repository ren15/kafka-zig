from kafka import KafkaProducer

print("start producer")


producer = KafkaProducer(bootstrap_servers="localhost:19092")

for i in range(10):
    producer.send("test", b"message %d" % i)

producer.flush()

print("producer finishes")
