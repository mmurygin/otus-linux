# Vagrant DNS Lab

A Bind's DNS lab with Vagrant and Ansible, based on CentOS 7.

## Playground

<code>
    vagrant ssh client
</code>

  * zones: dns.lab, reverse dns.lab and ddns.lab
  * ns01 (192.168.50.10)
    * master, recursive, allows update to ddns.lab
  * ns02 (192.168.50.11)
    * slave, recursive
  * client1 (192.168.50.15)
    * used to test the env, runs rndc and nsupdate
  * client2 (192.168.50.16)
    * used to test the env, runs rndc and nsupdate
  * zone transfer: TSIG key

## Homework
добавить еще один сервер client2
завести в зоне dns.lab
имена
web1 - смотрит на клиент1
web2 смотрит на клиент2

завести еще одну зону newdns.lab
завести в ней запись
www - смотрит на обоих клиентов

настроить split-dns
клиент1 - видит обе зоны, но в зоне dns.lab только web1

клиент2 видит только dns.lab

## Check Solution
1. Init environment
  ```bash
  vagrant up
  ```

1. Check client1/client2 dns resolution
  ```bash
  vagrant ssh client1

  dig web1.dns.lab
  dig web2.dns.lab
  dig www.newdns.lab
  dig -x 192.168.50.16

  dig @192.168.50.11 web1.dns.lab
  dig @192.168.50.11 web2.dns.lab
  dig @192.168.50.11 www.newdns.lab
  dig @192.168.50.11 -x 192.168.50.16
  ```
