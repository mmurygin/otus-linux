#!/bin/bash

echo IMPORTANT: Please make sure that ports 2222, 8001-8005 are opened

if [[ ! -e ~/.ssh/config || -z $(grep "StrictHostKeyChecking no" ~/.ssh/config) ]]; then
    echo Disabling host check scanning for 127.0.0.1
    cat << EOF >> ~/.ssh/config
Host 127.0.0.1
    StrictHostKeyChecking no
EOF

    chmod 400 ~/.ssh/config
fi
exit 0


private_key="${HOME}/.vagrant.d/insecure_private_key"

echo Forwarding centralRouter to localhost:8001
ssh -i "$private_key" -L 8001:192.168.255.2:22 -p 2222 -N vagrant@127.0.0.1 &
sleep 1

echo Forwarding centralServer to localhost:8002
ssh -i "$private_key" -L 8002:192.168.0.2:22 -p 2222 -N vagrant@127.0.0.1 &
sleep 1

echo Forwarding office1Router to localhost:8003
ssh -i "$private_key" -L 8003:192.168.254.2:22 -p 8001 -N vagrant@127.0.0.1 &
sleep 1

echo Forwarding office1Server to localhost:8004
ssh -i "$private_key" -L 8004:192.168.2.2:22 -p 8003 -N vagrant@127.0.0.1 &
sleep 1

echo Forwarding office2Router to localhost:8005
ssh -i "$private_key" -L 8005:192.168.254.3:22 -p 8001 -N vagrant@127.0.0.1 &
sleep 1

echo Forwarding office2Server to localhost:8006
ssh -i "$private_key" -L 8006:192.168.1.2:22 -p 8005 -N vagrant@127.0.0.1 &
sleep 1
