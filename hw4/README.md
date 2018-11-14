# Booting Linux

## Homework
1. Попасть в систему без пароля несколькими способами
1. Установить систему с LVM, после чего переименовать VG
1. Добавить модуль в initrd

## Check Results
1. Попасть в систему без пароля несколькими способами
    1. Первый способ взят из [документации RedHat](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/sec-terminal_menu_editing_during_boot#sec-Changing_and_Resetting_the_Root_Password) (ссылка из лекции)
        1. [редактируем конфиги grub'a при запуске](./images/change_grub_params.png)
        1. [меняем пароль от root](./images/change_root_password.png)

1. Установить систему с LVM, после чего переименовать VG
    1. `vagrant up`
    1. `vagrant ssh`
    1. `lsblk`

1. Добавить модуль в initrd

