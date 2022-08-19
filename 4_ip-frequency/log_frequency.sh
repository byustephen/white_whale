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

  #declare and associative array. Assumes we are running bash 4.x
  declare -A addresses

  #add the addresses as a key and value pair to the associative array
  for i in "${!addresses[@]}"; do
    echo "Key: $i" "|" "Value: ${addresses[$i]}"
  done

  #loop through all addresses
  while IFS= read -r line || [ -n "$line" ];
    do

      ipaddress=$(echo ${line} | awk '{print $3}')

      #if the address is found, add 1 to the value, 
      #otherwise add the key and set value as 1. 
      if [[ -v addresses[$ipaddress] ]]; then
        #address found
        addresses[$ipaddress]=$((addresses[$ipaddress]+1))
      else
        #address not found
        addresses[$ipaddress]=1
        
      fi 
    done < "${filepath}"

    #print the results and pipe to the sort command. 
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