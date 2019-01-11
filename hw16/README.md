# Networking

## Introduction
1. [Homework](homework.md)
1. [Theory](theory.md)
1. [Network-diagram](network-diagram.png)

## Solution

### Before
1. Please make sure that ports 2222, 8001-8005 are opened on your localhost
    ```bash
    ss -ltn
    ```

### Getting Started
1. Run environment
    ```bash
    vagrant up
    ```

1. Setup ssh tunnels (we need some handy way to connect to vms after removing eth0)
    ```bash
    ./host/setup-ssh-tunnels.sh
    ```

1. Disable eth0 on vms
    ```bash
    ./host/disable-all-if-eth0.sh
    ```

### Check Results
1. Connect to any vm
    ```bash
    ssh -i ~/.vagrant.d/insecure_private_key -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null vagrant@127.0.0.1 -p port
    ```

    * ports mapping:
        * centralRouter: 8001
        * centralServer: 8002
        * office1Router: 8003
        * office1Server: 8004
        * office2Router: 8005
        * office2Server: 8006

1. Check network settings and connectivity
    ```bash
    ip route
    tracepath -n some-ip
    ping some-internal-ip
    ping some-external-ip
    ```

### After
```bash
vagrant destroy -f
```
