 #author <kimkiogora@gmail.com>
 cat /var/log/somelog.log |  grep "`date +%Y' '%b' '%d" "%H:%M --date '-5 min'`"
