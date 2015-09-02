#capture threads per process
ps aux | awk '{print $11}' | sort | uniq -c | sort -nk1 | tail -n5
