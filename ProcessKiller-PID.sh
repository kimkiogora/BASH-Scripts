#Kim Kiogora
#ps aux | grep 'someprocesshere' | grep -v grep | awk '{print $2}' |  xargs -I {} echo {}

ps aux | grep 'someprocesshere' | grep -v grep | awk '{print $2}' |  xargs -I {} kill -9 {}
