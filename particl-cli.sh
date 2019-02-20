#!/bin/bash

docker exec -ti btcpayserver_particld particl-cli -datadir="/data" "$@"
