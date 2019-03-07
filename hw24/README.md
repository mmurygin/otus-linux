# MySQL Replication

## Homework
развернуть дамп и настроить репликацию
В материалах приложены ссылки на вагрант для репликации
и дамп базы bet.dmp
базу развернуть на мастере
и настроить чтобы реплицировались таблицы
| bookmaker |
| competition |
| market |
| odds |
| outcome

* Настроить GTID репликацию

варианты которые принимаются к сдаче
- рабочий вагрантафайл
- скрины или логи SHOW TABLES
* конфиги
* пример в логе изменения строки и появления строки на реплике


## Solution
1. Setup environment
    ```bash
    vagrant up
    ```

1. Restore master backup and start slave
    ```bash
    vagrant ssh slave
    mysql -uroot -p'uBW94U&8^079'

    source /vagrant/master.sql
    CHANGE MASTER TO \
        MASTER_HOST="master", \
        MASTER_USER="repl", \
        MASTER_PASSWORD="uBW94U&8^080", \
        MASTER_AUTO_POSITION=1;

    START SLAVE;

    SHOW SlAVE STATUS\G;
    ```

## Check Result
```bash
vagrant ssh master
mysql -uroot -p'uBW94U&8^079' -D 'bet' -e 'INSERT INTO bookmaker (id,bookmaker_name) VALUES(1,"1xbet");'
exit

vagrant ssh slave
mysql -uroot -p'uBW94U&8^079' -D 'bet' -e 'SELECT * FROM bookmaker;'
exit
```
