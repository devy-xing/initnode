#!/bin/bash

# Update package list
apt-get update

# Install necessary dependencies (example for Ethereum node)
apt-get install -y software-properties-common
add-apt-repository -y ppa:ethereum/ethereum
apt-get update
apt-get install -y ethereum

# Start the Ethereum node (example command)
geth --syncmode "fast" --http --http.api "eth,web3" &