#!/bin/sh

r="utils/kill.sh"
d=`pwd`
# d="/opt/doscker"

for n in * ; do
	#echo $d/$n könyvtár.
	if test -f "$d/$n/$r"; then
		echo $d/$n leállítása.
		cd $d/$n
		$d/$n/$r
	fi
done