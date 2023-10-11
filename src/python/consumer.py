from kafka import KafkaConsumer

cosumer = KafkaConsumer("test", bootstrap_servers="localhost:19092")

last_position = cosumer.position(cosumer.assignment()[0])


for message in cosumer:
    print(message)
    if message.offset == last_position - 1:
        break
