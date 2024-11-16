#!/bin/sh

# petalinux-create -t project -n os --template zynq

#petalinux-config --get-hw-description=../hw/hw_handoff/system_wrapper.xsa
#petalinux-config -c rootfs
petalinux-config -c kernel

petalinux-build

# petalinux-package --boot --fsbl images/linux/zynq_fsbl.elf --fpga images/linux/system.bit --uboot --force
# petalinux-build --sdk
# petalinux-package --sysroot