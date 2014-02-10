#!/bin/bash
memTotal=`cat /proc/meminfo | grep MemTotal | awk -F " " '{ print $2}'`
memFree=`cat /proc/meminfo | grep MemFree | awk -F " " '{ print $2}'`
memBuffers=`cat /proc/meminfo | grep Buffers | awk -F " " '{ print $2}'`
memCached=`cat /proc/meminfo | grep Cached | head -1 | awk -F " " '{ print $2}'`
memActive=`cat /proc/meminfo | grep Active | head -1 | awk -F " " '{ print $2}'`

case $1 in
    memfree)
    echo "scale=2; $memFree*100/$memTotal" | bc
    ;;
    buffers)
    echo "scale=2; $memBuffers*100/$memTotal" | bc
    ;;
    cached)
    echo "scale=2; $memCached*100/$memTotal" | bc
    ;;
    active)
    echo "scale=2; $memActive*100/$memTotal" | bc
    ;;
esac
