#!/bin/bash
CPU_UTILIZATION=`cat /proc/loadavg`

echo "content-type: text/plain"
echo "CPU utiliozation is: $CPU_UTILIZATION"