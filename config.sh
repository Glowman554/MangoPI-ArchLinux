#!/usr/bin/sh
export CROSS_COMPILE='riscv64-linux-gnu-'
export ARCH='riscv'
PWD="$(pwd)"
NPROC="$(nproc)"
export PWD
export NPROC

export ROOT_FS='archriscv-2023-06-07.tar.zst'
export ROOT_FS_DL="https://archriscv.felixc.at/images/${ROOT_FS}"


# folder to mount rootfs
export MNT='mnt'
# folder to store compiled artifacts
export OUT_DIR="${PWD}/output"

# run as root
export SUDO='sudo'

export VERSION_OPENSBI='1.2'

export SOURCE_OPENSBI="https://github.com/riscv-software-src/opensbi/releases/download/v${VERSION_OPENSBI}/opensbi-${VERSION_OPENSBI}-rv-bin.tar.xz"
export SOURCE_UBOOT='https://github.com/smaeul/u-boot'
export SOURCE_KERNEL='https://github.com/torvalds/linux.git'
export SOURCE_RTL8723='https://github.com/lwfinger/rtl8723ds.git'

export TAG_UBOOT='d1-2022-10-31'
export TAG_KERNEL='v6.4'
export DEBUG='n'

check_deps() {
    if ! dpkg-query -l "${1}" >/dev/null; then
        echo "Please install '${1}'"
        exit 1
    fi
}
