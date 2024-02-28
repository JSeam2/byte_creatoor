#!/bin/sh

# start the master node

sudo /mnt/lv/seaweed/weed \
    -logdir=./seaweed/log/master master \
    -ip=192.168.0.2 \
    -port=9333 \
    -port.grpc=19333 \
    -mdir=./seaweed/metadata \
    -defaultReplication=002 \
    -ip.bind=0.0.0.0 \
    -volumePreallocate \
    -volumeSizeLimitMB 500000 \
    -metricsPort=9324 > ./seaweed/log/master/logfile.log 2>&1&

# wait for the master node to initialize

sleep 5

# start the filer

sudo /mnt/lv/seaweed/weed \
    -logdir=./seaweed/log/filer filer \
    -master=192.168.0.2:9333 \
    -ip.bind=0.0.0.0 \
    -port=8888 \
    -port.grpc=18888 \
    -maxMB 1000 \
    -concurrentUploadLimitMB 10000 \
    -metricsPort=9326 > ./seaweed/log/filer/logfile.log 2>&1&

# start the volume server

sudo /mnt/lv/seaweed/weed \
    -logdir=./seaweed/log/volume volume \
    -mserver=192.168.0.2:9333 \
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