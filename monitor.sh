#!/bin/bash

# Author: Madhavan S
# GitHub: @witherking946
# License: MIT (Xyspace Network)

function draw_box() {
    echo "+------------------------------------------------------+"
    printf "| %-50s |\n" "$1"
    echo "+------------------------------------------------------+"
}

function sysmon() {
    clear
    draw_box "SYSTEM STATS - SYSTEM RESOURCE MONITOR"
    echo

    HOSTNAME=$(hostname)
    UPTIME=$(uptime -p)
    KERNEL=$(uname -r)
    USER=$(whoami)
    CPU=$(top -bn1 | grep "load average" | awk '{print $10 $11 $12}')
    MEM=$(free -h | awk '/^Mem:/ {print $3 " used / " $2}')
    DISK=$(df -h / | awk 'NR==2 {print $3 " used / " $2}')
    TEMP=$(sensors 2>/dev/null | grep -m 1 'temp1' | awk '{print $2}' || echo "N/A")

    draw_box "Hostname: $HOSTNAME\nUser: $USER\nUptime: $UPTIME\nKernel: $KERNEL\nCPU Load: $CPU\nMemory Usage: $MEM\nDisk Usage: $DISK\nCPU Temp: $TEMP"

    echo
    echo "Press any key to exit..."
    read -n 1 -s
}

# Run the monitor
sysmon
