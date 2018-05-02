#!/bin/bash

if [ $# -ne 1 ]; then
    echo 'Please specify CUDA version: e.g., "bash build.sh 9.0"'
    exit 1
fi

nvidia-docker run \
--rm \
-v $PWD:/root/build -ti mitmul/pynvvl:cuda-$1 \
bash -c "cd nvvl && mkdir build && cd build && \
cmake ../ && make -j && \
cp -r /usr/local/lib /root/build && \
cp libnvvl.so /root/build/lib && \
cp -r /root/nvvl/include /root/build/"
