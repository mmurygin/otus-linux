#!/bin/bash

echo IMPORTANT: Please make sure that ports 8001-8010 are opened

private_key="${HOME}/.vagrant.d/insecure_private_key"
ssh_options="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

echo Forwarding centralRouter to localhost:8001
ssh -i "$private_key" -L 8001:192.168.255.2:22 $ssh_options -p 2222 -N vagrant@127.0.0.1 &
sleep 1

echo Forwarding centralServer to localhost:8002
ssh -i "$private_key" -L 8002:192.168.0.2:22 $ssh_options -p 8001 -N vagrant@127.0.0.1 &
sleep 1

echo Forwarding office1Router to localhost:8003
ssh -i "$private_key" -L 8003:192.168.255.10:22 $ssh_options -p 8001 -N vagrant@127.0.0.1 &
sleep 1

echo Forwarding office1Server to localhost:8004
ssh -i "$private_key" -L 8004:192.168.2.2:22 $ssh_options -p 8003 -N vagrant@127.0.0.1 &
sleep 1

echo Forwarding office2Router to localhost:8005
ssh -i "$private_key" -L 8005:192.168.255.11:22 $ssh_options -p 8001 -N vagrant@127.0.0.1 &
sleep 1

echo Forwarding office2Server to localhost:8006
ssh -i "$private_key" -L 8006:192.168.1.2:22 $ssh_options -p 8005 -N vagrant@127.0.0.1 &
sleep 1

echo Forwarding testServer1 to localhost:8007
ssh -i "$private_key" -L 8007:192.168.2.66:22 $ssh_options -p 8003 -N vagrant@127.0.0.1 &
sleep 1

echo Forwarding testClient1 to localhost:8008
ssh -i "$private_key" -L 8008:192.168.2.3:22 $ssh_options -p 8003 -N vagrant@127.0.0.1 &
sleep 1

echo Forwarding testServer2 to localhost:8009
ssh -i "$private_key" -L 8009:192.168.2.67 $ssh_options -p 8003 -N vagrant@127.0.0.1 &
sleep 1

echo Forwarding testClient2 to localhost:8010
ssh -i "$private_key" -L 8010:192.168.2.4:22 $ssh_options -p 8003 -N vagrant@127.0.0.1 &
sleep 1

echo "Done"
