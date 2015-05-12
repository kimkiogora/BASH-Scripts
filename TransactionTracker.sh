#@uthor <kimkiogora@gmail.com>
log_file=/data/sample_info.log-20150325.gz
key_word_A='RequestID'
key_word_B='2015'
key_word_M='Finished processing request with ID'
result=`zgrep -ae $key_word_B $log_file  | grep $key_word_A | awk '{print $12}' | awk -F'|' '{print $1}'|sort|unique`
for trxID in $result;
do
echo "TransactionID $trxID count is" `zgrep -ae $key_word_B $log_file | grep -i $key_word_A| grep -i $trxID | grep -vc $key_word_M`
done
