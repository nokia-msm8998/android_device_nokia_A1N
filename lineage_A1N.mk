#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Indicate the first api level the device has been commercially launched on
PRODUCT_SHIPPING_API_LEVEL := 26

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from A1N device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_NAME := lineage_A1N
PRODUCT_DEVICE := A1N
PRODUCT_MANUFACTURER := HMD Global
PRODUCT_BRAND := Nokia
PRODUCT_MODEL := Nokia 8 Sirocco

PRODUCT_GMS_CLIENTID_BASE := android-hmd-rev2

# This platform does not have an SDCard slot.
PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceName=Avenger_00WW \
    BuildDesc="A1N_00WW_FIH-user 10 QKQ1.190828.002 00WW_5_14L release-keys" \
    BuildFingerprint=Nokia/Avenger_00WW/A1N_sprout:10/QKQ1.190828.002/00WW_5_14L:user/release-keys
