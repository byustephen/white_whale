# Overview
Each task is broken down by directory, and has the number appended to the front. The only exception is the apache_logs dir, and that's a simple helper utility to generate example logs. 

Each task is either conceptual or you can acutally run it. For example, you could run task 1 and make sure the docker file works, and you can also run the scripts for tasks 4 & 5. But since this isn't connected to a kubernetes cluster you can't run the kubernetes objects in task 2, nor the deployment in task 3. 

So for each task I'll break it down and if it's runnable I'll include directions below.

## 1 - Dockerfile
Just run `make build` and then `make run`. Though I ran into a library issue on my arm laptop
## 2 - Kubernetes Objects
## 3 - Deployments
-didn't finish due to time and getting covid (omicron). 
## 4 - Log parsing using a bash script
This is a simple bash script. It assumes that you have Bash version 5.x as it uses associative arrays. To run it, simply cd into the directory and execute it from the command line: `./log_frequency.sh`
## 5 - Log parsing using python 
This is a simply python script. It assumes you have python 3 installed. To run it you can either call the file through python `python log_frequency.py` or since it has an executable you could also just run the script `./log_frequency.py`
## 6 - Terraform IAM resources
This is a collection of terraform resources built as part of a module. These files validate but they aren't connected to any aws account. Still, they are useful as a conceptional guide on how to set up users and roles. 

