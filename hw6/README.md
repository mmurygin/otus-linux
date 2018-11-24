## Systemd

## Homework
1. Написать сервис, который будет раз в 30 секунд мониторить лог на предмет наличия ключевого слова. Файл и слово должны задаваться в /etc/sysconfig
1. Из epel установить spawn-fcgi и переписать init-скрипт на unit-файл. Имя сервиса должно так же называться.
1. Дополнить юнит-файл apache httpd возможностьб запустить несколько инстансов сервера с разными конфигами

## Check result

### Before

```bash
vagrant up
vagrant ssh
```

### Monitor log file

1. [Solution](monitor)

1. Check results
    ```bash
    systemctl status monitor.service
    systemctl status monitor.timer

    journalctl -u monitor.service
    ```

### Unit for spawn-fcgi
1. [Solution](fcgi)
1. Check results
    ```bash
    systemctl status spawn-fcgi.service
    curl localhost
    ```

### Templates for httpd
1. [Solution](httpd)
1. Check results
    ```bash
    systemctl status httpd@httpd1.service
    systemctl status httpd@httpd2.service
    ```

    ```bash
    curl localhost:8000
    curl localhost:8001
    ```
