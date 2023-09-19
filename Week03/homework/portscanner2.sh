
#! /bin/bash

prefix=$1
port=$2

echo "hosts followed by open ports"

for i in $(seq 1 25); do
  ip=${prefix}.${i}
  timeout .1 bash -c "echo >/dev/tcp/$ip/$port" 2>/dev/null &&
  echo "$ip, $port"
done
