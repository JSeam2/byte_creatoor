#!/bin/sh

mkdir -p ./seaweed/log/volume
mkdir -p ./seaweed/volume

# start the volume server

sudo weed \
    -logdir=./seaweed/log/volume volume \
    -mserver=0.0.0.0:9333 \
    -ip.bind=0.0.0.0 \
    -port=8080 \
    -port.grpc=18080 \
    -max=0 \
    -rack rack1 \
    -fileSizeLimitMB=1000000 \
    -dir ./seaweed/volume \
    -idleTimeout 600 \
    -concurrentDownloadLimitMB 100000 \
    -concurrentUploadLimitMB 100000 \
    -inflightUploadDataTimeout 10m0s \
    -metricsPort=9325 > ./seaweed/log/volume/logfile.log 2>&1&