#! /bin/bash
set -e 

## -----------------------------------------------
## - Checkout thrift
## -----------------------------------------------

rm -r /tmp/*
cd /tmp/
wget https://github.com/apache/thrift/archive/0.9.3.tar.gz
tar -xvzf 0.9.3.tar.gz
cd thrift-0.9.3

## -----------------------------------------------
## - Set open SSL path
## -----------------------------------------------

OPENSSL_DIR=/usr
echo "OpenSSL dir $OPENSSL_DIR"

## -----------------------------------------------
## - Build and install
## -----------------------------------------------

(
    if [ ! -f Makefile ]; then
        ./bootstrap.sh
        ./configure \
            --without-ruby \
            --without-perl \
            --without-php \
            --without-go \
            --without-nodejs \
            --with-openssl=$OPENSSL_DIR
    else
        echo "Thrift Makefile detected, skipping bootstrap and configure"
    fi
    make && make install
)
