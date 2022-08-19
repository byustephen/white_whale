#!/bin/bash

_runpath=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

_pip_check=$(/usr/local/bin/pip3 list | grep -F log-generator)

if [[ ${_pip_check} =~ "log-generator" ]]; then
	echo "log generator exists"
else
	echo "installing log generator"
	/usr/local/bin/pip3 install log-generator
fi

log-generator -t ${_runpath}/config.config

