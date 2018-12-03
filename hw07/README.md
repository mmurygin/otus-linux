# PAM

## Homework
1. Запретить всем пользователям, кроме группы admin логин в выходные и праздничные дни
2. Дать конкретному пользователю права рута

## Solution
### Запретить всем пользователям, кроме группы admin логин в выходные и праздничные дни
#### Ход решения
1. Долго пытался найти как же в `time.conf` прописать группу пользователей. В итоге не нашёл и сделал обходное решение в виде добавления двух строчек в `/etc/pam.d/login`:

    ```
    account    [success=1 default=ignore] pam_succeed_if.so user ingroup admin
    account    required     pam_time.so
    ```
1. В `time.conf` просто запретил всем `login` в выходные дни

    ```
    login;*;*;Wk0000-2400
    ```

#### Demo

1. Setup
    ```bash
    vagrant up
    vagrant ssh
    sudo /vagrant/disable_wd_login/setup.sh
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


### Дать конкретному пользователю права рута
#### Ход решения
1. Переходим в рута и смотрим какие у него есть `capabilities`
    ```bash
    sudo -i
    getpcaps $$
    ```

1. Сохраняем в файл `/etc/security/capability.conf` capabilities и имя пользователя (`vagrant`)
1. Добавляем в файл `/etc/pam.d/su` строчку
    ```bash
    auth            optional        pam_cap.so
    ```

    * так же можно добавить в `/etc/pam.d/system-auth`. Тогда при логине за этого пользователя будут применяться capabilities
1. Меняем через `su` на необходимого пользователя
    ```bash
    sudo su vagrant
    ```

    * если добавляли `pam_cap` в `system-auth` то можно перелогиниться и увидеть ожидаемый эффект
1. Смотрим `capabilities`

    ```bash
    getpcaps $$
    ```

#### Demo
1. Setup
    ```bash
    vagrant up
    vagrant ssh
    sudo /vagrant/give_root/setup.sh
    ```

1. Check results
    ```bash
    sudo su vagrant
    getpcaps $$
    ```

#### Comments
1. Не получилось дать `capabilities` при использовании `sshd`. Возможно из-за вот этого ограничения из документации `pam_cap`:

    The module must not be called by a multithreaded application.
