# NFS

## Homework
Vagrant stand NFS или SAMBA
NFS или SAMBA на выбор:

vagrant up должен поднимать 2 виртуалки: сервер и клиент
на сервер должна быть расшарена директория
на клиента она должна автоматически монтироваться при старте (fstab или autofs)
в шаре должна быть папка upload с правами на запись
- требования для NFS: NFSv3 по UDP, включенный firewall

* Настроить аутентификацию через KERBEROS

## Check Solution
```bash
vagrant up
vagrant ssh client
cd /var/share/upload # this will force autofs to mount this dir
mount # view the mount dirs list
```

