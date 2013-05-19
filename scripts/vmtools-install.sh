#!/bin/bash
# Run as root
if [[ $USERNAME != "root" ]] ; then
  echo "Please run as root"
  exit 1
fi
if [[ ! -d /mnt/cdrom ]] ; then
  mkdir /mnt/cdrom
fi
mount /dev/cdrom /mnt/cdrom
cp /mnt/cdrom/VMwareTools-8.3.12-493255.tar.gz /tmp
umount /mnt/cdrom
cd /tmp
tar xfz VMwareTools-8.3.12-493255.tar.gz
cd /tmp/vmware-tools-distrib
./vmware-install.pl --default
