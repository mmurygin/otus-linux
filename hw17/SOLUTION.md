## Теория

### Анализ сетей
1. Сеть office1
    - 192.168.2.0/26 - dev
        * hosts range: **192.168.2.1-192.168.2.62**
        * hosts count: **62**
        * broadcast: **192.168.2.63**
    - 192.168.2.64/26 - test servers
        * hosts range: **192.168.2.64-192.168.2.126**
        * hosts count: **62**
        * broadcast: **192.168.2.127**
    - 192.168.2.128/26 - managers
        * hosts range: **192.168.2.128-192.168.2.190**
        * hosts count: **62**
        * broadcast: **192.168.2.191**
    - 192.168.2.192/26 - office hardware
        * hosts range: **192.168.2.128-192.168.2.190**
        * hosts count: **62**
        * broadcast: **192.168.2.191**

1. Сеть office2
    - 192.168.1.0/25 - dev
        * hosts range: **192.168.1.1-192.168.1.126**
        * hosts count: **126**
        * broadcast: **192.168.1.127**
    - 192.168.1.128/26 - test servers
        * hosts range: **192.168.1.128-192.168.1.190**
        * hosts count: **62**
        * broadcast: **192.168.1.191**
    - 192.168.1.192/26 - office hardware
        * hosts range: **192.168.1.128-192.168.1.190**
        * hosts count: **62**
        * broadcast: **192.168.1.191**

1. Сеть central
    - 192.168.0.0/28 - directors
        * hosts range: **192.168.0.1-192.168.0.14**
        * hosts count: **14**
        * broadcast: **192.168.0.15**
    - 192.168.0.32/28 - office hardware
        * hosts range: **192.168.0.32-192.168.0.46**
        * hosts count: **14**
        * broadcast: **192.168.0.47**
    - 192.168.0.64/26 - wifi
        * hosts range: **192.168.0.64-192.168.0.126**
        * hosts count: **62**
        * broadcast: **192.168.0.127**

### Свободные подсети
1. **192.168.0.16/28**
1. **192.168.0.48/28**
1. **192.168.0.128/25**
