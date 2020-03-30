#!/bin/sh
### BEGIN INIT INFO
# Provides:          nodejs
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: node.js start
### END INIT INFO
start_node(){
	if [ -z "$pid" ];then
	su pi -c "nohup  node /var/www/html/cors-anywhere/server.js </dev/null&>/dev/null &"
		echo 'prozess gestartet'
	else
		echo 'prozess läuft bereits'
	fi
}
stop_node(){
	if [ ! -z "$pid" ];then
		kill $pid	
		pid=""
		echo 'prozess beendet'
	fi
}



PATH=/var/www/html/cors-anywhere/:/usr/bin/:/bin/
#pid von Prozess speichern falls er schon läuft
pid=$(ps -C node -o pid,cmd=|awk '$3~/cors-anywhere\/server\.js/{print$1}')
echo $pid
if [ ! -z "$pid" ]; then
	echo 'true'
else
	echo 'false'
fi
case "$1" in
    start)
    # START
	start_node
        ;;
    stop)
	#stop
	stop_node
	;;
    restart)
    # RESTART
	stop_node
	sleep 1
	start_node
	;;
esac


exit 0
