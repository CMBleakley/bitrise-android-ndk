#! /bin/bash
set -e 

## -----------------------------------------------
## - Checkout thrift
## -----------------------------------------------

cd /
git clone git@github.com:apache/thrift.git
cd thrift
git checkout 0.9.3

## -----------------------------------------------
## - Set open SSL path
## -----------------------------------------------

OPENSSL_DIR=/usr
echo "OpenSSL dir $OPENSSL_DIR"

## -----------------------------------------------
## - Build and install
## -----------------------------------------------

(
    cd $THRIFT_DIR
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
