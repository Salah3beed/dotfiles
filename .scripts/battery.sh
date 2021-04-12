#!/bin/bash

acpi_path=$(find /sys/class/power_supply/ -name 'BAT*' | head -1)
BAT=$(acpi -b | grep -E -o '[0-9][0-9]?%')
charge_status=$(cat "$acpi_path/status")
# Full and short texts
echo "$charge_status: $BAT"
# Set urgent flag below 5% or use orange below 20%
[ ${BAT%?} -le 5 ] && exit 33
[ ${BAT%?} -le 20 ] && echo "#FF8000"

exit 0
