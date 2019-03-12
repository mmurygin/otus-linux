FROM mysql/mysql-server

ARG SERVER_ID

COPY my.cnf /etc/my.cnf

RUN sed -i 's/SERVER_ID/'"$SERVER_ID"'/g' /etc/my.cnf
