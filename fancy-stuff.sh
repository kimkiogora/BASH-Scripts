#Show threads per core
lscpu | grep Thread | grep -i core | awk '{print $4}'

#Get IP in ubuntu
ifconfig | grep 'Bcast' | grep 'inet addr' | awk '{print $2}'| sed -e 's/addr://g'

#List files greater than specific size
ls -l | awk '{if ($5 > $your_size_here) print $9}'

#Indepth search
du -a . | awk '$1*512 < 2000 {print $2} '

#Substring example
tail -n10000 Somelog.log  | grep "SomeID : "|awk '{print $7}' | cut -c1-5 | sort |uniq"

#list directories only
ls -l | egrep '^d'

#List files only
ls -l | egrep -v ‘^d’

#Maintanacnce
ls -l | egrep -v '^d' | grep -v '.txt'

#Remove file starting with `
rm -rf \`*
