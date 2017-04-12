FROM bitriseio/android-ndk:latest

## Install dependencies from apt
RUN apt-get -y update && \
    apt-get install -y \
      libtool \
      bison \
      libssl-dev \
      flex \
      g++ \
      automake \
      awscli \
      cmake
      awscli && \
    apt-get -y clean

## Install thrift at /deps
RUN mkdir /deps && cd /deps && wget https://github.com/apache/thrift/archive/0.9.3.tar.gz && \
    tar -xvzf 0.9.3.tar.gz && \
    rm 0.9.3.tar.gz && \
    cd thrift-0.9.3 && \
    ./bootstrap.sh && \
    ./configure \
      --without-ruby \
      --without-perl \
      --without-php \
      --without-go \
      --without-nodejs \
      --with-openssl=/usr && \
    make && make install

## Install openBlas at /deps
RUN cd /deps && mkdir openBLAS
