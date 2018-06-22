FROM ubuntu:16.04
ENV KERAS_BACKEND="cntk"
RUN apt-get update && apt-get install -y --no-install-recommends \
    # General
    ca-certificates \
    wget \
    build-essential \
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
# Get CNTK Binary Distribution
RUN pip install cntk && pip install keras && pip install unicodecsv && pip install distance && pip install jellyfish
ENTRYPOINT /bin/bash