
#! /bin/bash

hostfile=$1
portfile=$2

echo "hosts followed by open ports"
for host in $(cat $hostfile); do
	echo "Checking hosts: $host"
  for port in $(cat $portfile); do
    timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null &&
      echo "$host,$port"
  done
done
