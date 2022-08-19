#!/usr/local/bin/python3

with open("../apache_logs/access.log", "r") as a_file:
	address_count= {}

	for line in a_file:
		line_contents = line.strip()
		ipaddress = line_contents.split()[2]

		if ipaddress in address_count.keys():
			address_count[ipaddress]+=1
		else:
			address_count[ipaddress]=1
		
	sorted_list = sorted(address_count.items(), key=lambda x: x[1], reverse=True)

	for pair in sorted_list:
		print(pair[1], " ", pair[0])

	#Annnnnnndddd that's why python is so much better than bash for doing stuff like this. 