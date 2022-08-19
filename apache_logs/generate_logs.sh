#!/bin/bash

_pip_check=$(/usr/local/bin/pip3 list | grep -F log-generator)

if [[ ${_pip_check} =~ "log-generator" ]]; then
	echo "log generator exists"
else
	echo "installing log generator"
	/usr/local/bin/pip3 install log-generator
fi

echo "remember to set your log file path in the config.config file "

#clean out the existing log
> ${_runpath}/config.config

log-generator -t config.config

