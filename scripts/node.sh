#!/bin/sh -eux

NODE_VERSION="4.5.0"
NODE_SRC="https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.gz"

wget $NODE_SRC -P /usr/src
cd /usr/src && tar xvfz node-v$NODE_VERSION.tar.gz

cd /usr/src/node-v$NODE_VERSION && ./configure && make && make install

rm -rf /usr/src/node-v$NODE_VERSION
rm -rf /usr/src/node-v$NODE_VERSION.tar.gz
