#!/bin/bash

# Options for mounting the exFAT filesystem
options="rw,nosuid,nodev,uid=1000,gid=1000,dmask=0077,utf8=1,showexec,flush,uhelper=udisks2"

# The mount point should be specified as the first argument ($1)
# The device (e.g., /dev/sdb2) should be specified as the second argument ($2)
device=$1
mount_point=$2

# Mount the exFAT filesystem with the specified options
sudo mount -t exfat -o "$options" "$device" "$mount_point"
