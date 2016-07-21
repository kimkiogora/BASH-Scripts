#capture threads per process
ps aux | awk '{print $11}' | sort | uniq -c | sort -nk1 | tail -n5

ps aux | awk '{print $1}' | sort | uniq -c | sort -nk1 | tail -n5


load=`uptime | awk '{print $8,$9,$10}' | sed -e "s/,//g" | tr " " "\n"`

for i in $load
do
echo "Load is $i"
done
