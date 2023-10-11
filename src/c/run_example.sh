

gcc src/c/examples/consumer.c -o consumer \
    -Isrc/c/librdkafka-2.2.0/src -Lsrc/c/lib/lib -lrdkafka
echo "Running consumer"

LD_LIBRARY_PATH=$PWD/src/c/lib/lib \
    ./consumer "127.0.0.1:19092" g1 "test"


