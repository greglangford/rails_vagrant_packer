sed -i.bak s/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g /etc/default/grub
rm -rf /etc/default/grub.bak
