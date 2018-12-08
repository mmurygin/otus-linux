# Monitoring and performance tuning for web servers

## Homework
Написать playbook для первоначальной настройки хоста после инсталляции по всем прошедшим лекциям
- установка нужных инструментов для анализа и траблшутинга
- избавление ядра и сетевых настроек от "десктопности"
- установка разнообразных параметров ядра под работу в качестве сервера


## Solution
1. Kernel performance tuning files:
    * [sysctl.conf](roles/tunned-nginx/files/etc/sysctl.conf)
    * [limits.conf](roles/tunned-nginx/files/etc/security/limits.conf)

1. [Nginx tuning files](roles/tunned-nginx/files/etc/nginx/conf.d)

1. Run result
    ```bash
    vagrant up
    vagrant ssh

    # check sysctl configs
    cat /etc/sysctl.conf

    # check file descriptor limit for root
    sudo -i ulimit -n

    # check nginx configs
    sudo nginx -T
    ```
