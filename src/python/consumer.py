from kafka import KafkaConsumer, TopicPartition

print("start consumer")

cosumer = KafkaConsumer(bootstrap_servers="localhost:19092")


def set_offset_last_N(consumer, topics, last_n):
    """
    Set all topics to last_n messages from the end.

    """
    tp_list = [TopicPartition(topic, 0) for topic in topics]
    consumer.assign(tp_list)
    consumer.seek_to_end()

    last_positions = {}
    for tp in tp_list:
        last_position = consumer.position(tp)
        last_positions[tp.topic] = last_position

        if last_position < last_n:
            position_to_set = 0
        else:
            position_to_set = last_position - last_n

        print("Setting offset for topic {} to {}".format(tp.topic, position_to_set))
        consumer.seek(tp, position_to_set)
    return last_positions


last_position = set_offset_last_N(cosumer, ["test"], 1000)


for message in cosumer:
    print(message)
    if message.offset == last_position[message.topic] - 1:
        break

print("consumer finishes")
