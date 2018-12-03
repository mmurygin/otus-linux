# Build linux kernel

## Getting started

1. Run vm and install new kernel

    ```bash
    vagrant up
    ```

2. Set default kernel version in GRUB

    * Open and edit the file /etc/default/grub. Set:
        ```bash
        GRUB_DEFAULT=0
        ```

    * Recreate the kernel configuration
        ```bash
        grub2-mkconfig -o /boot/grub2/grub.cfg
        ```

3. Reboot your system
