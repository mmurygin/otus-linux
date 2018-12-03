# Booting Linux

## Homework
1. Попасть в систему без пароля несколькими способами
1. Установить систему с LVM, после чего переименовать VG
1. Добавить модуль в initrd

## Check Results
### Попасть в систему без пароля несколькими способами
1. Первый способ взят из [документации RedHat](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/sec-terminal_menu_editing_during_boot#sec-Changing_and_Resetting_the_Root_Password) (ссылка из лекции)
    1. Останавливаем загрузчик перед `pivot_root`
        1. нажимаем `e` в меню граба
        1. добавляем в параметры запуска ядра (строчка `linux16`) команду `rd.break enforcing=0`
        1. перезагружаемся с установленными параметрами `ctrl+x`
    1. Меняем пароль от `root`
        ```bash
        mount -o remount,rw /sysroot
        chroot /sysroot
        passwd
        touch /.autorelabel
        mount -o remount,ro /
        exit
        exit
        ```
1. Второй способ основан на подмене процесса с которого стартует ядро (по умолчанию это `/sbin/init`)
    1. Подменяем `init` процесс
        1. нажимаем `e` в меню граба
        1. добавляем в параметры запуска ядра (строчка `linux16`) команду `init=/sysroot/bin/sh`
        1. перезагружаемся с установленными параметрами `ctrl+x`
    1. Меняем пароль от `root`
        ```bash
        mount -o remount,rw /
        passwd
        touch /.autorelabel
        mount -o remount,ro /
        reboot
        ```

### Установить систему с LVM, после чего переименовать VG
1. Скрипт для переименования root volume group: `rename-vg.sh`
1. Для проверки результатов можно запустить
    1. `vagrant up`
    1. `vagrant ssh`
    1. `lsblk`

### Добавить модуль в initrd
1. Скрипт создания модуля: `dracut/add-module.sh`
1. Для проверки можно запустить vm и увидеть пингвинчика при запуске.
1. Либо можно зайти в запущенный бокс и запустить
    ```bash
    lsinitrd -m /boot/initramfs-$(uname -r).img | grep pinguin
    ```
