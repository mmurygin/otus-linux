#!/bin/bash

echo IMPORTANT: Please make sure that ports 8001-8002 are opened

private_key="${HOME}/.vagrant.d/insecure_private_key"
ssh_options="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=FATAL"

echo Forwarding centralRouter to localhost:8001
ssh -i "$private_key" -L 8001:192.168.255.2:22 $ssh_options -p 2222 -N vagrant@127.0.0.1 &
sleep 1

echo Forwarding centralServer to localhost:8002
ssh -i "$private_key" -L 8002:192.168.0.2:22 $ssh_options -p 8001 -N vagrant@127.0.0.1 &
sleep 1

echo Copy private ssh key to centralRouter to test access to inetRouter
scp -i "$private_key" $ssh_options -P 8001 "$private_key" vagrant@127.0.0.1:~/.ssh/id_rsa

echo "Done"
