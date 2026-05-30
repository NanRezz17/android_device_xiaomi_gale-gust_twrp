#
# Copyright (C) 2026 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/gust

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Configure 64bit
TARGET_IS_64_BIT := true
TARGET_USES_64_BIT_BINDER := true
TARGET_BOARD_SUFFIX := _64 

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6768
TARGET_NO_BOOTLOADER := true

# Techniques
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_NINJA_USES_ENV_VARS += RTIC_MPGEN
BUILD_BROKEN_PLUGIN_VALIDATION := soong-libaosprecovery_defaults soong-libguitwrp_defaults soong-libminuitwrp_defaults soong-vold_defaults

# Power Set
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Assertation
TARGET_OTA_ASSERT_DEVICE := gust

# Specify Crypto FBE
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_CRYPTO_BEANPOD := true
BOARD_USES_METADATA_PARTITION := true
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY := 2
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
BOOT_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Kernel Information
BOARD_KERNEL_IMAGE_NAME := Image.gz
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz

# Modern Boot Control Configuration (Android 15)
PRODUCT_PACKAGES += android.hardware.boot-service.default_recovery
TW_INCLUDE_BOOT_IMPLEMENTATION := true

# Vendor Boot
TARGET_KERNEL_ARCH := arm64
BOARD_RAMDISK_USE_LZ4 := true
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_NO_KERNEL := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_PAGESIZE := 4096
BOARD_BOOT_HEADER_VERSION := 3
BOARD_BOOTIMG_PARTITION_SIZE := 0x4000000
BOARD_DTB_SIZE := 168651
BOARD_HEADER_SIZE := 2112
BOARD_VENDOR_CMDLINE := "bootopt=64S3,32N2,64N2 androidboot.selinux=permissive"

# MKBOOTIMG
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_MKBOOTIMG_ARGS += --vendor_cmdline "$(BOARD_VENDOR_CMDLINE)"
BOARD_MKBOOTIMG_ARGS += --pagesize $(BOARD_KERNEL_PAGESIZE) --board " "

# Move to Vendor Partitions
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
TW_LOAD_VENDOR_BOOT_MODULES := true

# Hardware and Platform
BOARD_USES_MTK_HARDWARE := true
TARGET_BOARD_PLATFORM := mt6768

# fstab
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/recovery.fstab

# Dynamic Partitions size
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SUPER_PARTITION_SIZE := 7516192768

# Mount and Dynamic Partitions configuration
BOARD_SUPER_PARTITION_GROUPS := main
BOARD_MAIN_PARTITION_LIST := system system_ext product vendor vendor_dlkm odm
BOARD_MAIN_SIZE := 7505707008
BOARD_PARTITION_LIST := $(call to-upper, $(BOARD_MAIN_PARTITION_LIST))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := erofs))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p))))
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USES_MKE2FS := true
TW_INCLUDE_FUSE_NTFS := true
TW_INCLUDE_FUSE_EXFAT := true

# Recovery
TARGET_NO_RECOVERY := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_SECURE_ERASE := true

# Format Resolution and Display
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_SCREEN_DENSITY := 320
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_DEFAULT_BRIGHTNESS := 200
TW_MAX_BRIGHTNESS := 2047
TW_FRAMERATE := 90

# Verified Boot
BOARD_AVB_ENABLE := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_gust
TARGET_RECOVERY_DEVICE_MODULES := libinit_gust

# Main TWRP Configurations
TW_STATUS_ICONS_ALIGN := center
TW_THEME := portrait_hdpi
TWRP_NEW_THEME := true
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_PREPARE_DATA_MEDIA_EARLY := true
TW_USE_NEW_MINADBD := true
TW_EXCLUDE_APEX := true
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := id
TW_HAS_NO_DISPLAY_CUTOUT := false
# TW_STATUS_BAR_HEIGHT := 90
# TW_Y_OFFSET := 90
# TW_H_OFFSET := -90
TW_NO_LEGACY_PROPS := true
TW_NO_BIND_SYSTEM := true
TW_BACKUP_EXCLUSIONS := /data/fonts
TW_INPUT_BLACKLIST := "hbtp_vm"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.usb0/lun.%d/file
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true

# Fastbootd
TW_INCLUDE_FASTBOOTD := true

# Debug
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TWRP_EVENT_LOGGING := true

# Tools
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_LPTOOLS := true

# Spesial config
TW_DEVICE_VERSION := v3.7.1 for Redmi 13C
MAINTAINER := NanRezz