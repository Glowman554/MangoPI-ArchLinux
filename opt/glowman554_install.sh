set -ex

pacman -S neofetch sudo --noconfirm
echo neofetch >> /etc/bash.bashrc

echo LANG=de_DE.UTF-8 > /etc/locale.conf

echo de_DE.UTF-8 UTF-8 > /etc/locale.gen
echo de_DE ISO-8859-1 >> /etc/locale.gen
echo de_DE@euro ISO-8859-15 >> /etc/locale.gen
echo en_US.UTF-8 >> /etc/locale.gen

locale-gen

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

USER=janick

useradd -m -g users -s /bin/bash $USER
passwd $USER
gpasswd -a $USER wheel

echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

rm /opt/glowman554_install.sh
