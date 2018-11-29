# PAM

## Homework
1. Запретить всем пользователям, кроме группы admin логин в выходные и праздничные дни
2. Дать конкретному пользователю права рута

## Solution
#### Запретить всем пользователям, кроме группы admin логин в выходные и праздничные дни
##### Ход решения
1. Долго пытался найти как же в `time.conf` прописать группу пользователей. В итоге не нашёл и сделал обходное решение в виде добавления двух строчек в `/etc/pam.d/login`:

    ```
    account    [success=1 default=ignore] pam_succeed_if.so user ingroup admin
    account    required     pam_time.so
    ```
1. В `time.conf` просто запретил всем `login` в выходные дни

    ```
    login;*;*;Wk0000-2400
    ```

##### Demo

1. Setup
    ```bash
    vagrant up
    vagrant ssh
    /vagrant/disable_wd_login/setup.sh
    ```
1. Check
    ```bash
    useradd us1
    passwd us1

    useradd us2
    passwd us2

    groupadd admin
    usermod -a -G admin us1
    ```

    * `us1` - может залогиниться в любой день недели
    * `us2` - может залогиниться только в будние дни
