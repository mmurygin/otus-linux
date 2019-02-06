# Web Servers

## Homework
Написать конфигурацию nginx, которая даёт доступ клиенту только с определенной cookie.
Если у клиента её нет, нужно выполнить редирект на location, в котором кука будет добавлена, после чего клиент будет обратно отправлен (редирект) на запрашиваемый ресурс.

Смысл: умные боты попадаются редко, тупые боты по редиректам с куками два раза не пойдут

## Solution
1. Run environment
    ```bash
    vagrant up
    ```

1. Check with curl
    ```bash
    # check that we are redirected when there is no cookie
    curl -I localhost:8080

    # check set cookie header
    curl -I --cookie 'originUrl=http://localhost:8080/otus.html' localhost:8080/secret

    # check response status with cookie
    curl -I --cookie "secret=supersecret" localhost:8080
    ```

1. Check with browser
    ```bash
    google-chrome http://localhost:8080/otus.html
    ```
