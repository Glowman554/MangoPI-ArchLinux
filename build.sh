set -ex

. ./config.sh

LOOPDEV=18
IMG=${TAG_KERNEL}-$ROOT_FS.img

bash 1_compile.sh

dd if=/dev/zero of=./$IMG bs=1M count=2048 status=progress
sudo losetup /dev/loop$LOOPDEV $IMG
bash 2_create_sd.sh /dev/loop$LOOPDEV
sudo losetup -d /dev/loop$LOOPDEV

sudo mkdir /var/www/html/archriscv || true
sudo mv $IMG /var/www/html/archriscv/.
