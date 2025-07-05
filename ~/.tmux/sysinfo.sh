#!/bin/bash
# RAM: used/total (GB)
ram=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
# CPU: % usage (promedio 1s)
cpu=$(top -bn2 | grep "Cpu(s)" | tail -n1 | awk '{print $2+$4"%"}')
# Temp (si tienes sensors)
temp=$(sensors 2>/dev/null | grep 'Tctl:' | awk '{print $2}' | head -1)
[ -z "$temp" ] && temp="N/A"
echo " $ram |  $cpu |  $temp" 