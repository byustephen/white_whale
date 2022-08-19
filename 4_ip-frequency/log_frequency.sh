#!/usr/local/bin/bash

####################### GLOBAL VARS ########################
basepath=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
filepath=${basepath}/../apache_logs/access.log
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
  if [[ ! -f "$filepath" ]] 
  then
    printFormat ${PURPLE} "log file is missing"
    exit 0
  fi
}

function run(){

  declare -A addresses
  for i in "${!addresses[@]}"; do
    echo "Key: $i" "|" "Value: ${addresses[$i]}"
  done


  while IFS= read -r line || [ -n "$line" ];
    do

      ipaddress=$(echo ${line} | awk '{print $3}')

      if [[ -v addresses[$ipaddress] ]]; then
        #address found
        addresses[$ipaddress]=$((addresses[$ipaddress]+1))
      else
        #address not found
        addresses[$ipaddress]=1
        
      fi 
    done < "${filepath}"

    for k in "${!addresses[@]}"
    do
        echo ${addresses["$k"]} $k
    done |
    sort -rn -k3

}

############################################################

########################### RUN ############################
logFileCheck
run