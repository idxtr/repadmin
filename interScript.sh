#!/bin/bash
procNum=`awk 'NR == 1 {print NF}' `
ifNum=`grep "virtio.-input" /proc/interrupts | wc -l`

COUNTER=0
COUNTER1=1
if [ $procNum -gt 1 ]; then
        while [ $COUNTER1 -le $ifNum ]; do
                countEth=`grep "virtio.-input" inter.txt | awk -v STR=$COUNTER1 'NR==STR {print $2}'`
                ETH=`grep "virtio.-input" inter.txt | awk -v STR=$COUNTER1 'NR==STR {print $1}' | sed 's/://g'```
                CPU=`echo "obase=16; $[2 ** $COUNTER]" | bc`
                        if [ $CPU -eq 1 ]; then
                                CPU=2
                                let COUNTER=$COUNTER1+1
                        fi
                let COUNTER=$COUNTER+1
                let COUNTER1=$COUNTER1+1
                echo $CPU > /proc/irq/$ETH/smp_affinity

                if [ $COUNTER -gt $procNum ]; then
                        break
                fi
        done
fi
