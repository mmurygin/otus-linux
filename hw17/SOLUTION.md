## Теория

### Анализ сетей
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

### Свободные подсети
1. Сеть central
    1. **192.168.0.16/28**
    1. **192.168.0.48/28**
    1. **192.168.0.128/25**
