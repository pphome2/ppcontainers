#!/bin/sh

r="run.sh"
d=`pwd`
# d="/opt/doscker"

for n in * ; do
	#echo $d/$n könyvtár.
	if test -f "$d/$n/$r"; then
		echo $d/$n indítása.
		cd $d/$n
		$d/$n/$r
	fi
done