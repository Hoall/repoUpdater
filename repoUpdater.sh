#!/bin/bash

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#    author: Felix Paetow fhmpaetow@fsfe.org

s1isset=false
startpoint=''

if [ -n "$1" -a -d "$1" ]; then
	s1isset=true
	startpoint=$(pwd)
	echo -e "In $1"
	cd $1
fi

folder=$(ls -d */)

for f in $folder
do
	echo -e "Pull $f\n"
	cd $f
	git pull origin master
	cd ..
	echo -e "\nDone\n\n"
done

if [ $s1isset ]; then
	cd $startpoint
fi

exit

