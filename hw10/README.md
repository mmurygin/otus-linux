# LDAP

## Homework
1. Установить FreeIPA
2. Написать playbook для конфигурации клиента
3. Всю "сетевую лабораторию" перевести на аутентификацию через LDAP
4*. Настроить авторизацию по ssh-ключам

## Solution
1. Init server and client
    ```bash
    vagrant up
    ```

1. Create ldap user
    ```bash
    vagrant ssh ipaserver -c 'echo password | kinit admin && ipa user-add --first="Ivan" --last="Ivanov" --cn="Ivan Ivanov" --password ivanov --shell="/bin/bash"'
    ```

    * the command promt will ask you for a password for new user

1. Check login
    ```bash
    vagrant ssh client
    su -l ivanov
    ```
