#!/bin/bash

hemi_ver='v0.4.5'
curl -LO https://github.com/hemilabs/heminetwork/releases/download/${hemi_ver}/heminetwork_${hemi_ver}_linux_amd64.tar.gz
tar -xvzf heminetwork_${hemi_ver}_linux_amd64.tar.gz
mv ${hemi_ver} hemi
cd hemi


default_file="popm-address0.json"
./keygen -secp256k1 -json -net="testnet" > ${default_file}

priv_key=$(jq -r '.private_key' ${default_file})
address=$(jq -r '.pubkey_hash' ${default_file})

echo $priv_key > /tmp/hemi_info.txt
echo $address >> /tmp/hemi_info.txt

sleep 600

export POPM_BTC_PRIVKEY=${priv_key}
export POPM_STATIC_FEE=50
export POPM_BFG_URL=wss://testnet.rpc.hemi.network/v1/ws/public
./popmd