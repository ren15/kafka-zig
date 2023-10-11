
pushd `dirname $0`

wget -c https://github.com/confluentinc/librdkafka/archive/refs/tags/v2.2.0.zip

unzip -f v2.2.0.zip

mkdir -p lib 
cd librdkafka-2.2.0
./configure --prefix=$PWD/../lib
make -j$(nproc)
make install
ls -lah ../lib/

popd