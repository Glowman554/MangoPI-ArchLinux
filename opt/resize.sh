set -e

echo "Please resize the mmcblk0p2 partition and write the changes to the disk. DO NOT UNMOUNT THE PARTITION!"
echo "Press <enter> to continue"
read

cfdisk /dev/mmcblk0
resize2fs /dev/mmcblk0p2

echo "Rebooting NOW!"

reboot
