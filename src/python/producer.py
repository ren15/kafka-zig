from kafka import KafkaProducer
from kafka.admin import NewTopic, KafkaAdminClient

print("start producer")

admin_client = KafkaAdminClient(bootstrap_servers="localhost:19092")
# create topic
new_topic = NewTopic(name="test", num_partitions=1, replication_factor=1)
admin_client.create_topics(new_topics=[new_topic])


producer = KafkaProducer(bootstrap_servers="localhost:19092")

f_list = []

for i in range(10):
    f_list.append(producer.send("test", b"message %d" % i))

for f in f_list:
    print("futures resolved: ", f.get())


print("producer finishes")
