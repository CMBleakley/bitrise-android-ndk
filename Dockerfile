FROM bitriseio/android-ndk:latest

RUN apt-get -y update
RUN apt-get install -y libboost-dev libboost-test-dev libboost-program-options-dev libboost-filesystem-dev libboost-thread-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev awscli

#ADD setup_thrift.sh /setup_thrift.sh
#RUN /bin/bash /setup_thrift.sh
