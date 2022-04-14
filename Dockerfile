FROM nvcr.io/nvidia/pytorch:21.05-py3

# install faster transformer
# xx is the compute capability of your GPU. For example, 60 (P40) or 61 (P4) or 70 (V100) or 75(T4) or 80 (A100).

RUN git clone https://github.com/NVIDIA/FasterTransformer.git && \
    cd FasterTransformer && \
    mkdir -p build && \
    cd build && \
    cmake -DSM=80 -DCMAKE_BUILD_TYPE=Release -DBUILD_PYT=ON .. && \
    make 


RUN pip install transformers==2.5.1   && \
    pip install opennmt-py==1.1.1

RUN apt-get update && \
    apt-get install -y gdb

