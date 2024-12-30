#!/bin/bash

# Ensure submodules are populated.
git submodule update --init --recursive

# Copy and modify the build script for lancache-dns.
cp ./monolithic/build-locally.sh ./lancache-dns/build-locally.sh
sed -i 's/monolithic/lancache-dns/g' ./lancache-dns/build-locally.sh

# Execute both scripts.
cd ./monolithic
./build-locally.sh

cd ../lancache-dns
./build-locally.sh
