#!/bin/bash

declare -r old_name="VolGroup00"
declare -r new_name="rootvg"

vgrename -v $old_name $new_name
sed -i "s/\/${old_name}-/\/${new_name}-/g" /etc/fstab
sed -i "s/\([/=]\)${old_name}\([-/]\)/\1${new_name}\2/g" /boot/grub2/grub.cfg
dracut -f -v "/boot/initramfs-$(uname -r).img" "$(uname -r)"
