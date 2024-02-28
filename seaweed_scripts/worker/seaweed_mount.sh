#!/bin/sh

sudo fusermount -uz ./seaweed/data

sudo /mnt/lv/seaweed/weed -logdir=./seaweed/log/mount mount -dir=./seaweed/data -filer=192.168.0.2:8888 -cacheCapacityMB 2000000 -cacheDir=./seaweed/cache -dirAutoCreate -nonempty  > ./seaweed/log/mount/logfile.log 2>&1&
