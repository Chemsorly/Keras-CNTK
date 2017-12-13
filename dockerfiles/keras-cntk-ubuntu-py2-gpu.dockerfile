FROM nvidia/cuda:8.0-runtime-ubuntu14.04
ENV CNTK_VERSION="2.3"
ENV KERAS_BACKEND="cntk"
RUN apt-get update && apt-get install -y --no-install-recommends \
    # General
    ca-certificates \
    wget \
    git \
    && \
    # Clean-up
    apt-get -y autoremove \
    && \
    rm -rf /var/lib/apt/lists/*
# Get CNTK Binary Distribution
RUN CNTK_VERSION_DASHED=$(echo $CNTK_VERSION | tr . -) && \
    CNTK_SHA256="013d1050f2f8d7240274e140f41b01a29508f2296388728aababb776fef58667" && \
    wget -q https://cntk.ai/BinaryDrop/CNTK-${CNTK_VERSION_DASHED}-Linux-64bit-GPU.tar.gz && \
    echo "$CNTK_SHA256 CNTK-${CNTK_VERSION_DASHED}-Linux-64bit-GPU.tar.gz" | sha256sum --check --strict - && \
    tar -xzf CNTK-${CNTK_VERSION_DASHED}-Linux-64bit-GPU.tar.gz && \
    rm -f CNTK-${CNTK_VERSION_DASHED}-Linux-64bit-GPU.tar.gz && \
    /bin/bash /cntk/Scripts/install/linux/install-cntk.sh --py-version 27 --docker
SHELL ["/bin/bash", "-c"]
RUN source "/cntk/activate-cntk" && pip install keras && pip install unicodecsv && pip install distance && pip install jellyfish
ENTRYPOINT /bin/bash
