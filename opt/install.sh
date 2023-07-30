set -ex

pacman -Syu --noconfirm
pacman -S nano networkmanager openssh usbutils --noconfirm

systemctl enable systemd-timesyncd
systemctl enable NetworkManager
systemctl enable sshd

echo PermitRootLogin yes > /etc/ssh/sshd_config

chage --lastday 0 root

echo bash /opt/hello.sh >> /etc/bash.bashrc

rm /opt/install.sh

