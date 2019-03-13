# MySQL Cluster

## Homework
Кластер MySQL
развернуть InnoDB кластер в docker
* в docker swarm

в качестве ДЗ принимает репозиторий с docker-compose
который по кнопке разворачивает кластер и выдает порт наружу

## Solution
1. Setup environment
    ```bash
    ./setup.sh
    ```

1. Connect to cluster
    ```bash
    mysql -u cluster_admin -P6446 -h 127.0.0.1 -ppassword
    ```
