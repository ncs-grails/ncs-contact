#!/bin/bash

find `pwd` -type d | grep -v ".svn" > temp.file

for foo in `cat temp.file`; do
	folder=`echo "$foo" | sed -e 's/\/home\/ajz\/NetBeansProjects//g'`
	pushd $foo > /dev/null
		svn_url=`svn info | egrep "^URL:"`
	if [ "URL: https://svn.cccs.umn.edu/svn/netbeans${folder}" != "$svn_url" ]; then
		echo "$svn_url"
		echo $folder
	fi
	popd > /dev/null
done
