

#! /bin/bash
#
# +  Extract ID, Year, Trappability from BTS_data.txt for 13BTS010 -- 13BTS089
#	write to single output file, then later to a (.gz) that is reverse sorted by Trappability, includes three columns#

# ? have a parent script make child script
	# I think I have it figured out, but still stuck on the why part

# + go into directory, pull needed headers and add to a new file.
# + make a for loop, any snake 13BTS010 through 13BTS089, append to the file reversetrap, close loop
# + then sort by reverse, cut needed columns, column -t and append to output
# + Tidy up - remove reversetrap and zip output file

# Push from local to remote GitHup repo.


touch childscript_assn2.sh
	#makes child script, which will essentially be a clean version of the parent

echo "cd ../unix_2_files" > childscript_assn2.sh
	# need in this directory to access files

echo "cut -f1,2,4 BTS_data.txt | head -n1 > output" >> childscript_assn2.sh
	#gets the headers for the columns and writes to new file

echo 	"for snake in BTS_data.txt
do
	grep -E BTS0[1-8]" '$snake' ">> reversetrap
done" >> childscript_assn2.sh
	# specify location
	## return wanted range of snakes & append to new file

echo "sort -k4 -gr reversetrap | cut -f1,2,4 | column -t >> output" >> childscript_assn2.sh
	# sorts, cuts, and makes pretty output
echo "zip output.gz output" >> childscript_assn2.sh
	# converts to .gz file
echo "rm reversetrap" >> childscript_assn2.sh
	# removes temporary file

chmod u+x childscript_assn2.sh
	# makes executable

 ./childscript_assn2.sh
	# actually allows it to run


