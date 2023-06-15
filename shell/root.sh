#!/bin/bash
# This script is used to run a command as root in a graphical environment
auth_string=$(xauth list $DISPLAY)
tgt_display=$DISPLAY

first_arg=$1
if [ "${first_arg::1}" == "-" ] 
then
	sudo xauth add $auth_string && export DISPLAY=$tgt_display && sudo $@ 
else
	sudo xauth add $auth_string && export DISPLAY=$tgt_display && $@ 
fi