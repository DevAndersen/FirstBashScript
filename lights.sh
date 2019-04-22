#!/bin/bash

[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

lights[0]='/sys/class/leds/input6::numlock/brightness'
lights[1]='/sys/class/leds/input6::capslock/brightness'
lights[2]='/sys/class/leds/input6::scrolllock/brightness'

for i in {1..10}
do
	value=$(($i % 2))
	for file in ${lights[@]}
	do
		echo $value > $file
		sleep 0.15
	done
done
