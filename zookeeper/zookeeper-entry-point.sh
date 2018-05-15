if [ -z "$ZOOKEEPER_MYID" ]; then
	echo "error: zookeeper need a myid file under the dataDir path\n Your need to specify ZOOKEEPER_MYID before starting the service"
exit 1
fi 

if [ -z "$ZOOKEEPER_HOST" ]; then
	echo "error: You need to specify a ZOOKEEPER_HOST to bind to 0.0.0.0 in the /etc/hosts"
exit 1
fi


echo $ZOOKEEPER_MYID >> /root/zookeeper/data/myid
echo "0.0.0.0 $ZOOKEEPER_HOST" >> /etc/hosts

/root/zookeeper/bin/zkServer.sh start-foreground