echo -n | openssl s_client -connect [IP]:[PORT] | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > cert.cert
#xml VIA CURL
curl -i -X  POST --header "Expect:Content-Type:text/xml;charset=UTF-8" --data @postRequest.xml [URL]

#port forwarding
ssh -L 10050:ip:[port] user@[ip] -N

#Apache processes
tail -n50000 /var/log/httpd/access_log  |  awk '{print $1"\t"$4"\t"$7}' | perl -pe 's/\:\d\d\t/\t/g' | perl -pe 's/\?(\w\W*)*/\n/g'| sort -rn | uniq -c | sort -n | tail -n50000

#IPS
output="apachestats.txt"
netstat -natp | grep httpd | grep ESTABLISHED | awk '{print $5}' | cut -b1-15 | sort | uniq -c | sort -n|sed "s/^/`date +%s%N`/;s/\./_/g" | awk '{print $3 "-HITS,host=SERVER01,region=us-west value=",$2,$1}' |sed "s/;/_/g"|sed -e "s/value= /value=/g"| sed "s/^/SERVER01_APACHE_/" > $output

#Last 5 Min
#tail -n100000 [XXX].log | grep "`date +%Y'-'%m'-'%d" "%H:%M --date '-5 min'`" | awk '{print "SOmeKey-" $N,$M}'| sed -e "s/|//g" | xargs -I {} echo "{} `date +%s`" |nc [SOMEIP] 2003
