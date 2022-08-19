#!/usr/local/bin/python3

with open("../apache_logs/access.log", "r") as a_file:
	address_count= {}

	for line in a_file:
		line_contents = line.strip()
		columns = line_contents.split()
		ipaddress=columns[2]

		if ipaddress in address_count.keys():
			address_count[ipaddress]+=1
		else:
			address_count[ipaddress]=1
		
	sorted_dictionary = sorted(address_count.items(), key=lambda x: x[1], reverse=True)

	for pair in sorted_dictionary:
		print(pair[1], " ", pair[0])

	#Annnnnnndddd that's why python is so much better than bash for doing stuff like this. 