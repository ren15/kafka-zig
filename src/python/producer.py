from kafka import KafkaProducer

print("start producer")


producer = KafkaProducer(bootstrap_servers="localhost:19092")

f_list = []

for i in range(10):
    f_list.append(producer.send("test", b"message %d" % i))

for f in f_list:
    print("futures resolved: ", f.get())


print("producer finishes")
