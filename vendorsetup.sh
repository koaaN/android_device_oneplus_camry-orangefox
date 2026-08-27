#
# This file is part of the OrangeFox Recovery Project.
# Copyright (C) 2026 The OrangeFox Recovery Project
#
# SPDX-License-Identifier: GPL-3.0-or-later
#

FDEVICE="camry"

fox_get_target_device() {
    local chkdev

    chkdev=$(echo "$BASH_SOURCE" | grep -w "$FDEVICE")
    if [ -n "$chkdev" ]; then
        FOX_BUILD_DEVICE="$FDEVICE"
    else
        chkdev=$(set | grep BASH_ARGV | grep -w "$FDEVICE")
        [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
    fi
}

if [ -z "$1" ] && [ -z "$FOX_BUILD_DEVICE" ]; then
    fox_get_target_device
fi

if [ "$1" = "$FDEVICE" ] || [ "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    export LC_ALL="C"
    export FOX_AB_DEVICE=1
    export FOX_VIRTUAL_AB_DEVICE=1
    export FOX_USE_DMSETUP=1
    export FOX_TARGET_DEVICES="CPH2621,OP5D49L1"
    export FOX_ENABLE_KERNELSU_SUPPORT=1
    export FOX_ENABLE_KERNELSU_NEXT_SUPPORT=1
    export FOX_ENABLE_SUKISU_SUPPORT=1
fi
