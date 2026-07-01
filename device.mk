#
# Copyright (C) 2026 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/gale

# Core AOSP
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Virtual A/B and compression
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression_with_xor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Main config trees
$(call inherit-product, vendor/twrp/config/common.mk)

# API level
PRODUCT_SHIPPING_API_LEVEL := 33
PRODUCT_TARGET_VNDK_VERSION := 35
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Fastbootd and utilities
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.1-impl-mock \
    checkpoint_gc
    
# Boot control (Android 15)
PRODUCT_PACKAGES += \
    android.hardware.boot-service.default_recovery

# Override properties
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.fuse.passthrough.enable=true \
    ro.twrp.vendor_boot=true

# A/B OTA and partitions list
AB_OTA_UPDATER := true
ENABLE_VIRTUAL_AB := true
TARGET_ENFORCE_AB_OTA_PARTITION_LIST := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    gz \
    lk \
    logo \
    md1img \
    preloader \
    preloader_raw \
    scp \
    spmfw \
    sspm \
    tee \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor \
    system \
    product \
    system_ext \
    vendor \
    odm_dlkm \
    system_dlkm \
    vendor_boot \
    vendor_dlkm \
    mi_ext

# MediaTek A/B update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

#  Bootctrl
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery 

PRODUCT_PACKAGES_DEBUG += \
    bootctrl

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Health services
PRODUCT_PACKAGES += \
    android.hardware.health-service.example

# Keymastey and gatekeeper services
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/vendor/bin/hw/android.hardware.keymaster@4.1-service.beanpod:recovery/root/vendor/bin/hw/android.hardware.keymaster@4.1-service.beanpod \
    $(DEVICE_PATH)/recovery/root/vendor/bin/hw/android.hardware.gatekeeper-service.beanpod:recovery/root/vendor/bin/hw/android.hardware.gatekeeper-service.beanpod \
    $(DEVICE_PATH)/recovery/root/vendor/etc/init/android.hardware.gatekeeper-service.beanpod.rc:recovery/root/vendor/etc/init/android.hardware.gatekeeper-service.beanpod.rc \
    $(DEVICE_PATH)/recovery/root/vendor/etc/init/android.hardware.keymaster@4.1-service.beanpod.rc:recovery/root/vendor/etc/init/android.hardware.keymaster@4.1-service.beanpod.rc

# Fstab
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/root/first_stage_ramdisk/fstab.mt6768:recovery/root/first_stage_ramdisk/fstab.mt6768

# MediaTek platform path utilities
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

# Otacert
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(DEVICE_PATH)/security/miui_releasekey

# Build namespaces framework
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)