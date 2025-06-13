#!/bin/bash
echo 'What is the source directory?'
read sourceloc
while [ ! -d $sourceloc ] 
do
	echo Not a directory, please try again.
	read sourceloc
done
echo What was the destination directory you wish to checksum? 
read destloc
while [ ! -d $destloc ] 
do
	echo Directory not found, please try again or make sure you are connected to the server
	read destloc
done

echo computing sha256 checksums...

cd "$sourceloc"
find -type f -exec sha256sum {} + | sort > ~/Desktop/a.sha
cd "$destloc"
find -type f -exec sha256sum {} + | sort > ~/Desktop/b.sha
echo sha256 checksums computed
diff -u ~/Desktop/a.sha ~/Desktop/b.sha
echo 'printing differences, if no differences are printed, files all match! :)'
echo complete! 


