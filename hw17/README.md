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
        - [Getting Started](#getting-started)
        - [Check Solution](#check-solution)

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

1. Сеть central-net
    - 192.168.254.0/29
        * hosts range: **192.168.254.1-192.168.254.6**
        * hosts count: **6**
        * broadcast: **192.168.254.7**

1. Сеть router-net
    - 192.168.255.0/30
        * hosts range: **192.168.255.1-192.168.255.2**
        * hosts count: **2**
        * broadcast: **192.168.0.3**

#### Свободные подсети
1. Сеть central
    1. **192.168.0.16/28**
    1. **192.168.0.48/28**
    1. **192.168.0.128/25**


### Practise
#### Getting Started
1. Run environment
    ```bash
    vagrant up
    ```

1. Disable `eth0` interface for `centralRouter`
    ```bash
    vagrant ssh inetRouter
    ssh vagrant@192.168.255.2 # password 111111

    sudo -i
    nmcli device disconnect eth0
    nmcli connection delete "System eth0"
    ```

1. SSH to central router and disable `eth0` for every vm (_centralServer_, _office1Router_, _office2Router_, _office1Server_, _office2Server_).
    ```bash
    vagrant ssh inetRouter
    ssh vagrant@192.168.255.2 # password 111111
    ssh vagrant@machine-ip # password 111111

    sudo -i
    nmcli device disconnect eth0
    nmcli connection delete "System eth0"
    ```

#### Check Solution
1. SSH to any machine through **inetRouter**
    ```bash
    vagrant ssh inetRouter
    ssh vagrant@machine-ip #password 111111
    ```

1.  Check routes table
    ```bash
    ip route
    ```

1. Check connectivity
    ```bash
    ping google.com
    ping 192.168.x.x

    tracepath -n google.com
    tracepath -n 192.168.255.1
    ```
