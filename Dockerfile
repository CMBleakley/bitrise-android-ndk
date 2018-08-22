FROM bitriseio/android-ndk:v2018_04_28-09_19-b981

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
    apt-get -y clean && \
    bitrise update
