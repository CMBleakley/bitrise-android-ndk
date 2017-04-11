FROM bitriseio/android-ndk:latest

RUN apt-get -y update && \
    apt-get install -y \
      libboost-dev \
      libboost-test-dev \
      libboost-program-options-dev \
      libboost-filesystem-dev \
      libboost-thread-dev \
      libevent-dev \
      automake \
      libtool \
      flex \
      bison \
      pkg-config \
      g++ \
      libssl-dev \
      awscli && \
    apt-get -y clean

RUN cd / && wget https://github.com/apache/thrift/archive/0.9.3.tar.gz && \
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
    make && make install && cd / && rm -r /thrift-0.9.3

