#! /bin/bash
#
# Extract ID, Year, Trappability from BTS_data.txt for 13BTS010 -- 13BTS089
#	write to single output file(.gz) that is reverse sorted by Trappability, includes three columns

# go into directory, pull needed headers and add to a new file.
# make a loop  - for any snake 13BTS010 through 13BTS089, cut needed columns, append to the file reversetrappability
# then sort by reverse, cat output to output by appending it.....after all other parts are done, use column -t and >> to append to original file. Then close loop, and remove reversetrap file.

# for files *010-089, cut -f1,3,4 >> reversetrap




cd ../unix_2_files
	# need in this directory to access files

cut -f1,3,4 BTS_data.txt | head -n1 > output
	#gets the headers for the columns and writes to new file


for snake in $(cat BTS_data.txt)
	# need to specify file and can do so with cat
do
	grep -E BTS0[1-8] | cut -f1,3,4 >> reversetrap $snake
		#should return the wanted range of snakes 
	sort -k4 -nr reversetrap
done

column -t reversetrap

