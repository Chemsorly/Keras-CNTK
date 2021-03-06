FROM nvidia/cuda:9.0-runtime-ubuntu16.04
ENV KERAS_BACKEND="cntk"
RUN apt-get update && apt-get install -y --no-install-recommends \
    # General
    ca-certificates \
    wget \
    git \
    python \
    python-pip \
    python-setuptools \
	libpython2.7 \
    libopenmpi-dev \
    && \
    # Clean-up
    apt-get -y autoremove \
    && \
    rm -rf /var/lib/apt/lists/*
RUN pip install cntk-gpu && pip install keras && pip install unicodecsv && pip install distance && pip install jellyfish
ENTRYPOINT /bin/bash
