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
    vagrant up
    ./host/setup-ssh-tunnels.sh
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
