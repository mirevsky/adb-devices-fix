#!/bin/bash
echo "----------------------------------"
lsusb
echo "----------------------------------"

if [ ! -f /etc/udev/rules.d/51-android.rules ];then
   touch /etc/udev/rules.d/51-android.rules
fi

read -r -p "$(echo -e "idVendor:")" idVendor

read -r -p "$(echo -e "idProduct:")" idProduct

echo "SUBSYSTEM==\"usb\", ATTR{idVendor}==\"${idVendor}\", ATTR{idProduct}==\"${idProduct}\", MODE=\"0666\", GROUP=\"plugdev\"" >> /etc/udev/rules.d/51-android.rules

udevadm control --reload-rules

adb devices
