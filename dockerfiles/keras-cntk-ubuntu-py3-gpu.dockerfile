FROM nvidia/cuda:9.0-runtime-ubuntu16.04
ENV KERAS_BACKEND="cntk"
RUN apt-get update && apt-get install -y --no-install-recommends \
    # General
    ca-certificates \
    wget \
    git \
    python3 \
    python3-pip \
    python3-setuptools \
    libopenmpi-dev \
    && \
    # Clean-up
    apt-get -y autoremove \
    && \
    rm -rf /var/lib/apt/lists/*
RUN pip3 install cntk-gpu && pip3 install keras && pip3 install unicodecsv && pip3 install distance && pip3 install jellyfish
ENTRYPOINT /bin/bash