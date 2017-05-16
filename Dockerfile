FROM bitriseio/android-ndk:latest

## Install dependencies from apt
RUN apt-get -y update && \
    apt-get install -y \
      libtool \
      bison \
      libssl-dev \
      pkg-config \
      flex \
      g++ \
      automake \
      awscli \
      cmake \
      awscli && \
    apt-get -y clean
