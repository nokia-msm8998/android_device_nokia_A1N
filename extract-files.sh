#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
	# Patch Goodix fingerprint extensions to fix getBnConstructorMap
	vendor/lib64/libvendor.goodix.hardware.fingerprintextension@1.0.so)
            "${PATCHELF_0_17_2}" --remove-needed "libhidltransport.so" "${2}"
            "${PATCHELF_0_17_2}" --replace-needed "libhidlbase.so" "libhidlbase-v32.so" "${2}"
	;;
	# Remove all unused dependencies from FP blobs
	vendor/lib64/libgoodixhwfingerprint.so)
            "${PATCHELF_0_17_2}" --remove-needed "libsoftkeymasterdevice.so" "${2}"
	    "${PATCHELF_0_17_2}" --remove-needed "libkeymaster_messages.so" "${2}"
	;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=A1N
export DEVICE_COMMON=msm8998-common
export VENDOR=nokia
export VENDOR_COMMON=${VENDOR}

"./../../${VENDOR_COMMON}/${DEVICE_COMMON}/extract-files.sh" "$@"
