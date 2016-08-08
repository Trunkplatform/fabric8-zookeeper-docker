#!/bin/bash


if [ ! -z "$MAX_SERVERS" ]; then
  echo "Starting up in clustered mode"
  echo "" >> /opt/zookeeper/conf/zoo.cfg
  echo "#Server List" >> /opt/zookeeper/conf/zoo.cfg
  for i in $( eval echo {1..$MAX_SERVERS});do
    echo "server.$i=$DOCKERCLOUD_SERVICE_HOSTNAME-$i:2888:3888" >> /opt/zookeeper/conf/zoo.cfg
  done
  cat /opt/zookeeper/conf/zoo.cfg
else
	  echo "Starting up in standalone mode"
fi

exec /opt/zookeeper/bin/zkServer.sh start-foreground
