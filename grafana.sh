Grafana
-------
        cat /proc/loadavg | awk '{print $1}' | xargs -I {} echo "{} `date +%s%N`" | xargs -I {} curl -i -XPOST 'http://localhost:8086/write?db=localmetrics' --data-binary '5s_load_avg,host=krypton,region=us-west value={}'


        tail -n100 somelog.log | grep "`date +%Y'-'%m'-'%d" "%H:%M --date '-1 sec'`" | grep 'TimeTaken'| awk '{print $19}'| xargs -I {} curl -i -XPOST 'http://localhost:8086/write?db=localmetrics' --data-binary '1min_some_tat,host=krypton,region=us-west value={}'
