# Firewall

## Homework
Сценарии iptables
1) реализовать knocking port
- centralRouter может попасть на ssh inetrRouter через knock скрипт
пример в материалах
2) добавить inetRouter2, который виден(маршрутизируется) с хоста
3) запустить nginx на centralServer
4) пробросить 80й порт на inetRouter2 8080
5) дефолт в инет оставить через inetRouter

## Solution
1. Run environment
    ```bash
    ./setup.sh
    ```

1. Check knoking port
    ```bash
    ssh -i ~/.vagrant.d/insecure_private_key -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null vagrant@127.0.0.1 -p 8001

    # make sure that ssh port is closed
    ssh 192.168.255.1

    # open 22 port
    /vagrant/guest/knock.sh open

    # run ssh session
    ssh 192.168.255.1
    exit

    # close 22 port
    /vagrant/guest/knock.sh open
    ```

1. Check port forwarding
    ```bash
    curl localhost:8080
    ```

    * the above command doesn't work, although it should!

    * Port forwarding is setup correctly. To check port forwarding:

    ```bash
    vagrant ssh inetRouter2 -c 'curl -I 192.168.255.2:8080'
    ```

    * but there is some issue with routing. For some reason inetRouter does not forward response between its interfaces. I see the response packets on eth1, but there is nothing on eth0.

## Usefull info
1. Connect to a private vm
    ```bash
    ssh -i ~/.vagrant.d/insecure_private_key -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null vagrant@127.0.0.1 -p port
    ```

    * ports mapping:
        * centralRouter: 8001
        * centralServer: 8002
