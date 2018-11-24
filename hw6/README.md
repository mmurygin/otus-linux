## Systemd

## Homework
1. Написать сервис, который будет раз в 30 секунд мониторить лог на предмет наличия ключевого слова. Файл и слово должны задаваться в /etc/sysconfig
1. Из epel установить spawn-fcgi и переписать init-скрипт на unit-файл. Имя сервиса должно так же называться.
1. Дополнить юнит-файл apache httpd возможностьб запустить несколько инстансов сервера с разными конфигами

## Check result
### Before

1. `vagrant up`
1. `vagrant ssh`


### Написать сервис, который будет раз в 30 секунд мониторить лог на предмет наличия ключевого слова. Файл и слово должны задаваться в /etc/sysconfig

1. [Solution](monitor)
1. Check results
    ```bash
    journalctl -u monitor.service
    ```

### Дополнить юнит-файл apache httpd возможность запустить несколько инстансов сервера с разными конфигами
1. [Solution](httpd)
1. Check results
    ```bash
    systemctl status httpd@httpd1.service
    systemctl status httpd@httpd2.service
    ```
