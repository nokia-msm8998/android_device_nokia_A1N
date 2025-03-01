#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/nokia/A1N

# Inherit from the common device configuration.
TARGET_NOKIA_PLATFORM := msm8998
$(call inherit-product, device/nokia/msm8998-common/msm8998-common.mk)

# Amplifier calibration
PRODUCT_PACKAGES += \
    tfa-calib

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_configs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_configs.xml \
    $(DEVICE_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(DEVICE_PATH)/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
    $(DEVICE_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(DEVICE_PATH)/audio/audio_platform_info_i2s.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_i2s.xml \
    $(DEVICE_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(DEVICE_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/audio/audio_policy_configuration_a2dp_offload_disabled.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_a2dp_offload_disabled.xml \
    $(DEVICE_PATH)/audio/mixer_paths_tasha.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tasha.xml \
    $(DEVICE_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
    $(DEVICE_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

# Camera
PRODUCT_PACKAGES += \
    libgui_vendor:32

# HIDL
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true

# Hotword Enrollment
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-hotword.xml

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service.nokia-se

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    SecureElement

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(DEVICE_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# RFS MSM MPSS symlinks
PRODUCT_PACKAGES += \
    rfs_msm_mpss_fih_rfs_data_misc_symlink

# Ramdisk
PRODUCT_PACKAGES += \
    init.a1n.target.rc \
    init.fih.modemconfig.rc \
    init.fih.modemconfig.sh \
    init.fih.poweroff_charging.rc

# Wi-Fi
PRODUCT_PACKAGES += \
    WifiOverlayA1N

# Inherit device specific vendor makefiles
$(call inherit-product, vendor/nokia/A1N/A1N-vendor.mk)
