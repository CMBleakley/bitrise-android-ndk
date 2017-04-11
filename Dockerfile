FROM bitriseio/android-ndk:latest

RUN apt-get -y update
RUN apt-get install -y libboost-dev libboost-test-dev libboost-program-options-dev libboost-filesystem-dev libboost-thread-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev awscli
RUN apt-get -y clean

COPY setup_thrift.sh /tmp/setup_thrift.sh
RUN /bin/bash /tmp/setup_thrift.sh
