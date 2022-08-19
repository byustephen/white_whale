#!/bin/bash

####################### GLOBAL VARS ########################
_basepath=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
_filepath=${_basepath}/../apache_logs/access.log
############################################################

######################## FUNCTIONS #########################
function printFormat(){
  if [[ ! -z ${1} ]]; then
    _color=${1}
    shift
    printf "${_color}${@}${NC}\n"
  else
    echo ${@}
  fi
}

function logFileCheck(){
  if [ ! -f "$_filepath" ] 
  then
    printFormat ${PURPLE} "log file is missing"
    exit 0
  fi
}

############################################################

########################### MAIN ###########################
logFileCheck

while IFS= read -r line || [ -n "$line" ];
  do
    echo "${line}"

    


  done < "${_filepath}"

