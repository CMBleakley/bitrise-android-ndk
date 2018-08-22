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
    rm -r /root/.bitrise/ && \ 
    rm -r /root/.stepman/ && \
    curl -fL https://github.com/bitrise-io/bitrise/releases/download/1.21.0/bitrise-$(uname -s)-$(uname -m) > /usr/local/bin/bitrise && \
    bitrise setup && \
    bitrise stepman setup -c https://github.com/bitrise-io/bitrise-steplib.git && \
    bitrise stepman update

