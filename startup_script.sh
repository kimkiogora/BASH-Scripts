#Author Kim kiogora
DAEMON="Test"
DAEMONPATH="/home/kkiogora/java/"
PIDFILE="/home/kkiogora/java/$DAEMON.pid"

start(){
        echo "Starting daemon $DAEMON"
        if [ -e "$PIDFILE" ]
        then
                PID=`cat $PIDFILE`
                echo "Already running pid, $PID"
                exit 2
        else
                cd $DAEMONPATH
                nohup java $DAEMON &
                pid=`ps aux | grep $DAEMON | grep -v "grep"| awk '{print $2}'`
                echo $pid > $PIDFILE &
        fi
}

status(){
        pid=`ps aux | grep $DAEMON | grep -v "grep"| awk '{print $2}'`
        if [ ! -z "$pid" ]
        then
                echo "$DAEMON running with $pid"
        else
                echo "$DAEMON is now stopped/not running"
        fi
}

stop() {
        echo "Stopping daemon $DAEMON"
        pid=`ps aux | grep $DAEMON | grep -v "grep"| awk '{print $2}'`
        if [ ! -z "$pid" ]
        then
                echo "$DAEMON pid = $pid"
                kill -9 $pid
                rm -rf $PIDFILE
        fi
}

case "$1" in
    start)
        start
        status
        ;;
    stop)
        stop
        status
        ;;
    status)
        status
        ;;
    restart)
        stop
        start
        ;;
    *)
        echo "Usage:  {start|stop|status|restart}"
        exit 1
        ;;
esac
exit $?
