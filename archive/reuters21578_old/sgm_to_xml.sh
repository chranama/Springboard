#!/bin/sh

#I downloaded the document data from the following url:
#https://archive.ics.uci.edu/ml/machine-learning-databases/reuters21578-mld/reuters21578.tar.gz

#The data is in .sgm format, a legacy markup format
#To proceed, I need to convert to .xml.  I will use a unix tool called OpenSP
#via the Homebrew Package Manager

#The installation of Homebrew was done with the following command:
#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null 2> /dev/null

#With Homebrew installed, I installed the OpenSP package with the following command:
#brew install open-sp

#Here I'm running the osx command within OpenSP to convert all .sgm files to .xml

for num in {0..9}
do
	file="reut2-00${num}"
	osx ${file}.sgm > ${file}.xml
done
for num in {10..21}
do
	file="reut2-0${num}"
	osx ${file}.sgm > ${file}.xml
done

head -1 reut2-000.xml > reuters21578.xml
echo "<DATA>" >> reuters21578.xml
tail -n +2 -q reut2*.xml >> reuters21578.xml
echo "</DATA>" >> reuters21578.xml