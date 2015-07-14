#List files greater than specific size
ls -l | awk '{if ($5 > $your_size_here) print $9}'

#Indepth search
du -a . | awk '$1*512 < 2000 {print $2} '
