#!/usr/bin/env bash

cd "${AOSP_BUILD_DIR}"

# apply microg sigspoof patch
echo "applying microg sigspoof patch"
patch -p1 --no-backup-if-mismatch < "platform/prebuilts/microg/00002-microg-sigspoof.patch"

# apply custom hosts file
custom_hosts_file="https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
echo "applying custom hosts file ${custom_hosts_file}"
retry wget -q -O "${AOSP_BUILD_DIR}/system/core/rootdir/etc/hosts" "${custom_hosts_file}"
