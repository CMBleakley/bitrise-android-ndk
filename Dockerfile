FROM bitriseio/android-ndk:v2017_11_11-08_02-b764

## Install dependencies from apt
RUN apt-get -y update && \
    apt-get install -y \
      sbcl \
      libtool \
      bison \
      libssl-dev \
      pkg-config \
      flex \
      g++ \
      automake \
      awscli \
      cmake \
      libboost-all-dev \
      awscli && \
    apt-get -y clean
