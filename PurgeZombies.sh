#!/bin/bash
zombie_suspect='some-script.php'
count=`ps aux | grep -c $zombie_suspect|grep -v 'grep'`

echo "$count process(es) found"

if [ $count -gt 1 ];then
echo "Purging time !!"
pids=`ps aux | grep $zombie_suspect | awk '{print $2}'| uniq | sort`
for pid in $pids
do
echo "Purges $pid"
kill -9 $pid
sleep 0.05
done

echo "Revalidating ..."
sleep 1
#recap
count=`ps aux | grep -c $zombie_suspect|grep -v 'grep'`
if [ $count -eq 0 ];then
echo "Purge completed $count process(es) found"
else
echo "Purge failed ! $count process(es) still exist"
fi
fi
