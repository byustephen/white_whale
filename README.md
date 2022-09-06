# Overview
Each task is broken down by directory, and has the number appended to the front. The only exception is the apache_logs dir, and that's a simple helper utility to generate example logs. 

Each task is either conceptual or you can acutally run it. For example, you could run task 1 and make sure the docker file works (if I didn't get stuck on that necessary library for my ARM laptop), and you can also run the scripts for tasks 4 & 5. The other items are all just a reference. 

I didn't finish the deployment file since I ran out of time and got sick. 

Here are details and run instructions for each item. 

## 1 - Dockerfile
Just run `make build` and then `make run`. Though I ran into a library issue on my arm laptop and the build fails towards the end. 
## 2 - Kubernetes Objects
This is setup as kustomize templates. Just cd to the 2_kubernetes directory and run `kustomize build dev` and then pipe that to a kubectl file. Eg `kustomize build dev | kubectl apply -f -`
## 3 - Deployments
[didn't finish due to time and getting omicron-covid.] 
## 4 - Log parsing using a bash script
This is a simple bash script. It assumes that you have Bash version 5.x as it uses associative arrays. To run it, simply cd into the directory and execute it from the command line: `./log_frequency.sh`
## 5 - Log parsing using python 
This is a simply python script. It assumes you have python 3 installed. To run it you can either call the file through python `python log_frequency.py` or `python3 log_frequency.py` or since it has an executable path you could also just run the script `./log_frequency.py`
## 6 - Terraform IAM resources
This is a collection of terraform resources built as part of a module. These files validate but they aren't connected to any aws account. Still, they are useful as a conceptional guide on how to set up users and roles. 