# Networking

* [Homework](#homework)
  + [Планируемая архитектура](#%D0%BF%D0%BB%D0%B0%D0%BD%D0%B8%D1%80%D1%83%D0%B5%D0%BC%D0%B0%D1%8F-%D0%B0%D1%80%D1%85%D0%B8%D1%82%D0%B5%D0%BA%D1%82%D1%83%D1%80%D0%B0)
  + [Теоретическая часть](#%D1%82%D0%B5%D0%BE%D1%80%D0%B5%D1%82%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F-%D1%87%D0%B0%D1%81%D1%82%D1%8C)
  + [Практическая часть](#%D0%BF%D1%80%D0%B0%D0%BA%D1%82%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F-%D1%87%D0%B0%D1%81%D1%82%D1%8C)
* [Solution](#solution)
  + [Theory](#theory)
    - [Анализ сетей](#%D0%B0%D0%BD%D0%B0%D0%BB%D0%B8%D0%B7-%D1%81%D0%B5%D1%82%D0%B5%D0%B9)
    - [Свободные подсети](#%D1%81%D0%B2%D0%BE%D0%B1%D0%BE%D0%B4%D0%BD%D1%8B%D0%B5-%D0%BF%D0%BE%D0%B4%D1%81%D0%B5%D1%82%D0%B8)
  + [Practise](#practise)
    - [Before](#before)
    - [Check Solution](#check-solution)
    - [After](#after)

## Homework
### Планируемая архитектура
построить следующую архитектуру

Сеть office1
- 192.168.2.0/26 - dev
- 192.168.2.64/26 - test servers
- 192.168.2.128/26 - managers
- 192.168.2.192/26 - office hardware

Сеть office2
- 192.168.1.0/25 - dev
- 192.168.1.128/26 - test servers
- 192.168.1.192/26 - office hardware


Сеть central
- 192.168.0.0/28 - directors
- 192.168.0.32/28 - office hardware
- 192.168.0.64/26 - wifi

```
Office1 ---\
-----> Central --IRouter --> internet
Office2----/
```
Итого должны получится следующие сервера
- inetRouter
- centralRouter
- office1Router
- office2Router
- centralServer
- office1Server
- office2Server

### Теоретическая часть
- Найти свободные подсети
- Посчитать сколько узлов в каждой подсети, включая свободные
- Указать broadcast адрес для каждой подсети
- проверить нет ли ошибок при разбиении

### Практическая часть
- Соединить офисы в сеть согласно схеме и настроить роутинг
- Все сервера и роутеры должны ходить в инет черз inetRouter
- Все сервера должны видеть друг друга
- у всех новых серверов отключить дефолт на нат (eth0), который вагрант поднимает для связи
- при нехватке сетевых интервейсов добавить по несколько адресов на интерфейс


## Solution
### Theory
#### Анализ сетей
1. Сеть office1
    - 192.168.2.0/26 - dev
        * hosts range: **192.168.2.1-192.168.2.62**
        * hosts count: **62**
        * broadcast: **192.168.2.63**
    - 192.168.2.64/26 - test servers
        * hosts range: **192.168.2.66-192.168.2.126**
        * hosts count: **62**
        * broadcast: **192.168.2.127**
    - 192.168.2.128/26 - managers
        * hosts range: **192.168.2.129-192.168.2.190**
        * hosts count: **62**
        * broadcast: **192.168.2.191**
    - 192.168.2.192/26 - office hardware
        * hosts range: **192.168.2.193-192.168.2.254**
        * hosts count: **62**
        * broadcast: **192.168.2.254**

1. Сеть office2
    - 192.168.1.0/25 - dev
        * hosts range: **192.168.1.1-192.168.1.126**
        * hosts count: **126**
        * broadcast: **192.168.1.127**
    - 192.168.1.128/26 - test servers
        * hosts range: **192.168.1.129-192.168.1.190**
        * hosts count: **62**
        * broadcast: **192.168.1.191**
    - 192.168.1.192/26 - office hardware
        * hosts range: **192.168.1.193-192.168.1.254**
        * hosts count: **62**
        * broadcast: **192.168.1.255**

1. Сеть central
    - 192.168.0.0/28 - directors
        * hosts range: **192.168.0.1-192.168.0.14**
        * hosts count: **14**
        * broadcast: **192.168.0.15**
    - 192.168.0.32/28 - office hardware
        * hosts range: **192.168.0.33-192.168.0.46**
        * hosts count: **14**
        * broadcast: **192.168.0.47**
    - 192.168.0.64/26 - wifi
        * hosts range: **192.168.0.65-192.168.0.126**
        * hosts count: **62**
        * broadcast: **192.168.0.127**

1. Сеть router-net
    - 192.168.255.0/30
        * hosts range: **192.168.255.1-192.168.255.2**
        * hosts count: **2**
        * broadcast: **192.168.0.3**

1. Сеть central-net
    - 192.168.255.8/29
        * hosts range: **192.168.255.9-192.168.255.14**
        * hosts count: **6**
        * broadcast: **192.168.255.15**

#### Свободные подсети
1. Сеть **192.168.0.0/24**
    1. **192.168.0.16/28**
    1. **192.168.0.48/28**
    1. **192.168.0.128/25**
1. Сеть **192.168.255.0/24**
    1. **192.168.255.4/30**
    1. **192.168.255.16/28**
    1. **192.168.255.32/27**
    1. **192.168.255.64/26**
    1. **192.168.255.128/25**


### Practise
#### Before
1. Please make sure that ports 2222, 8001-8005 are opened on your localhost
    ```bash
    ss -ltn
    ```

#### Check Solution
1. Run environment
    ```bash
    vagrant up
    ```

1. Setup ssh tunnels (we need some handy way to connect to vms after removing eth0)
    ```bash
    ./host/setup-ssh-tunnels.sh
    ```

1. Disable eth0 on vms within private network
    ```bash
    ./host/disable-all-if-eth0.sh
    ```

1. Connect to any vm, check routes and connectivity
    ```bash
    ssh -i ~/.vagrant.d/insecure_private_key -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null vagrant@127.0.0.1 -p port
    ip route
    tracepath -n some-ip
    ping some-internal-ip
    ping some-external-ip
    ```

    * ports mapping:
        * centralRouter: 8001
        * centralServer: 8002
        * office1Router: 8003
        * office1Server: 8004
        * office2Router: 8005
        * office2Server: 8006

#### After
```bash
vagrant destroy -f
```
