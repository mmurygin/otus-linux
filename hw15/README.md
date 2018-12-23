# Logging

## Homework
Настраиваем центральный сервер для сбора логов
в вагранте поднимаем 2 машины web и log
на web поднимаем nginx
на log настраиваем центральный лог сервер на любой системе на выбор
- journald
- rsyslog
- elk
настраиваем аудит следящий за изменением конфигов нжинкса

все критичные логи с web должны собираться и локально и удаленно
все логи с nginx должны уходить на удаленный сервер (локально только критичные)
логи аудита уходят ТОЛЬКО на удаленную систему

## Check
1. up virtual machines
    ```bash
    vagrant up
    ```

1. check that critical errors are send to the log server
    ```bash
    vagrant ssh web
    logger -p crit this is critical error
    exit

    vagrant ssh log
    grep web /var/log/messages
    exit
    ```

1. check that nginx access logs are send to the log server
    ```bash
    vagrant ssh log
    curl -I web

    grep nginx /var/log/messages
    exit
    ```

1. check that all audit logs are sent to the log server
    ```bash
    vagrant ssh web

    # check that audit is empty
    ```

1. check auditing of `nginx` config changes
    ```bash
    vagrant ssh web
    vi /etc/nginx/nginx.conf # change something and save
    exit

    vagrant ssh log
    # check that we get audit message
    ```
