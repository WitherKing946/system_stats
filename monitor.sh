#!/bin/bash

# Author: Madhavan S
# GitHub: @witherking946
# License: MIT (Xyspace Network)

function draw_box() {
    echo "+-----------------------------+"
    printf "| %-27s |\n" "$1"
    echo "+-----------------------------+"
}

function gui_mode() {
    clear
    draw_box "SYSTEM RESOURCE MONITOR"
    echo

    CPU=$(top -bn1 | grep "load average" | awk '{print $10 $11 $12}')
    MEM=$(free -h | awk '/^Mem:/ {print $3 " used / " $2}')
    DISK=$(df -h / | awk 'NR==2 {print $3 " used / " $2}')

    draw_box "CPU Load: $CPU"
    draw_box "Memory: $MEM"
    draw_box "Disk: $DISK"

    echo
    echo "Press any key to exit..."
    read -n 1 -s
}

function terminal_mode() {
    echo "System Resource Monitor (Terminal Mode)"
    echo "Press Ctrl+C to exit"
    while true; do
        clear
        echo "CPU Load:"
        top -bn1 | grep "load average" | awk '{print "Load Average: " $10 $11 $12}'

        echo -e "\nMemory Usage:"
        free -h | grep -v "Swap"

        echo -e "\nDisk Usage:"
        df -h | grep '^/'

        sleep 2
    done
}

MODE=$1

if [ "$MODE" == "gui" ]; then
    gui_mode
else
    terminal_mode
fi
