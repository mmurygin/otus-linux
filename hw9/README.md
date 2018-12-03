# Working with processes

## Homework
Задания на выбор
1) написать свою реализацию ps ax используя анализ /proc
2) написать свою реализацию lsof
3) дописать обработчики сигналов в прилагаемом скрипте, оттестировать, приложить сам скрипт, инструкции по использованию
4) реализовать 2 конкурирующих процесса по IO. пробовать запустить с разными ionice
5) реализовать 2 конкурирующих процесса по CPU. пробовать запустить с разными nice

## Solution
### Before
```bash
vagrant up
vagrant ssh
cd /vagrant
```

### PS
```bash
./ps.py
```

### Signaling
```bash
./signal.py &
kill -10 pid
kill -15 pid
fg
```

### Nice
```bash
sudo ./nice/run.sh
```

## IO Nice
```bash
sudo ./ionice/run.sh
```
