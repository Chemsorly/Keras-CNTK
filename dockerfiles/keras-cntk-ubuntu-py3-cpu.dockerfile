FROM ubuntu:16.04
ENV CNTK_VERSION="2.5.1"
ENV KERAS_BACKEND="cntk"
RUN apt-get update && apt-get install -y --no-install-recommends \
    # General
    ca-certificates \
    wget \
    git \
    python3 \
    python-pip3 \
    && \
    # Clean-up
    apt-get -y autoremove \
    && \
    rm -rf /var/lib/apt/lists/*
RUN pip install cntk && pip install keras && pip install unicodecsv && pip install distance && pip install jellyfish
ENTRYPOINT /bin/bash