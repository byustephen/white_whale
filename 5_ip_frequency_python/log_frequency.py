#!/usr/local/bin/python3

with open("../apache_logs/access.log", "r") as a_file:
	address_count= {}

	# for each line, strip and split out the contents and get the 3rd item. Assumes log file stays the same format
	for line in a_file:
		line_contents = line.strip()
		ipaddress = line_contents.split()[2]

		#if the key exists, then add 1 to the value, otherwise add key and set value as 1. 
		if ipaddress in address_count.keys():
			address_count[ipaddress]+=1
		else:
			address_count[ipaddress]=1
		
	#sort the dictionary with a lambda and make sure reverse is set. 
	sorted_list = sorted(address_count.items(), key=lambda x: x[1], reverse=True)

	#print the list in the desired format. Count and ipaddress
	for pair in sorted_list:
		print(pair[1], " ", pair[0])

	#Annnnnnndddd that's why python is so much better than bash for doing stuff like this. 