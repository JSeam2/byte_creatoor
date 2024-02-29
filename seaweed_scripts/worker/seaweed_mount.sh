#!/bin/sh

sudo mkdir -p ./seaweed/log/mount
sudo mkdir -p ./seaweed/cache

sudo fusermount -uz ./seaweed/data

sudo weed -logdir=./seaweed/log/mount mount -dir=./seaweed/data -filer=<replace with master server ip>:8888 -cacheCapacityMB 2000000 -cacheDir=./seaweed/cache -dirAutoCreate -nonempty  > ./seaweed/log/mount/logfile.log 2>&1&
