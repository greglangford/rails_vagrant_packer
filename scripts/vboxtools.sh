#!/bin/sh -eux

HOME_DIR="${HOME_DIR:-/home/vagrant}";

export VBOX_VER="`cat /home/vagrant/.vbox_version`";
export KERN_VER="`rpm -qa | grep kernel-headers | cut -d "-" -f3-4`"
export KERN_DIR=/usr/src/kernels/$KERN_VER

echo "Virtualbox Tools Version: $VBOX_VER";
echo "Kernel Version: $KERN_VER"

mkdir -p /tmp/vbox;
mount -o loop $HOME_DIR/VBoxGuestAdditions_${VBOX_VER}.iso /tmp/vbox;
sh /tmp/vbox/VBoxLinuxAdditions.run \
    || echo "VBoxLinuxAdditions.run exited $? and is suppressed." \
        "For more read https://www.virtualbox.org/ticket/12479";
umount /tmp/vbox;
rm -rf /tmp/vbox;
rm -f $HOME_DIR/*.iso;
