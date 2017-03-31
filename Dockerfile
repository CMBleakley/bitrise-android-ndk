FROM bitriseio/android-ndk:latest

RUN apt-get update
RUN apt-get install -y libboost-dev libboost-test-dev libboost-program-options-dev libboost-filesystem-dev libboost-thread-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev awscli

ADD setup_thrift.sh /etc/my_init.d/099_bootstrap
