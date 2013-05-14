#
# Copyright (C) 2011 The Android Open-Source Project
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
USE_CAMERA_STUB := true

BOARD_VENDOR_HTC := true

-include vendor/qcom/proprietary/common/msm7627a/BoardConfigVendor.mk

TARGET_GLOBAL_CFLAGS   += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a5 -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS   += -DREFRESH_RATE=65 -DQCOM_NO_SECURE_PLAYBACK -DBINDER_COMPAT
COMMON_GLOBAL_CFLAGS   += -DQCOM_ICS_DECODERS -DQCOM_HARDWARE -DNO_UPDATE_PREVIEW

# Try to use ASHMEM if possible (when non-MDP composition is used)
TARGET_GRALLOC_USES_ASHMEM := true

TARGET_BOARD_PLATFORM := msm7627a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno203
BOARD_HAS_NO_SPEAKER := true # msm7627a doesn't have speaker
BOARD_HAS_NO_TOUCHSCREEN := false

TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_NEON := true
TARGET_ARCH_VARIANT_CPU := cortex-a5
TARGET_CPU_SMP := true
TARGET_HAVE_TSLIB := true

# Bionic
TARGET_CORTEX_CACHE_LINE_32 := true
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true

# Target information
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := protou

OVERRIDE_RS_DRIVER := libRSDriverArm.so

#TARGET_KERNEL_SOURCE := kernel/htc/msm7x27a
#TARGET_KERNEL_CONFIG := cyanogen_protou_defconfig
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_BASE := 0x03200000
BOARD_KERNEL_PAGESIZE := 2048
# Keep this as a fallback
TARGET_PREBUILT_KERNEL := device/htc/protou/kernel

BOARD_EGL_CFG := device/htc/protou/prebuilt/system/lib/egl/egl.cfg

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/htc/protou/releasetools
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/htc/protou/releasetools/ota_from_target_files

# Hardware rendering
USES_OPENGL_RENDERER := true

TARGET_SPECIFIC_HEADER_PATH := device/htc/protou/include

# Additional libraries
TARGET_PROVIDES_LIBAUDIO := true
BOARD_PREBUILT_LIBAUDIO := false

# Recovery
TARGET_USERIMAGES_USES_EXT4 := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_CUSTOM_GRAPHICS := ../../../device/htc/protou/recovery/graphics.c
TARGET_RECOVERY_INITRC := device/htc/protou/recovery/init-twrp.rc
TARGET_RECOVERY_FSTAB := device/htc/protou/recovery.fstab
TARGET_PREBUILT_RECOVERY_KERNEL := device/htc/protou/recovery/kernel
TARGET_USES_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/usb_mass_storage/lun0/file"
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"

# cat /proc/emmc
#dev:        size     erasesize name
#mmcblk0p17: 00040000 00000200 "misc"
#mmcblk0p21: 00c7f600 00000200 "recovery"
#mmcblk0p27: 00fffc00 00000200 "boot"
#mmcblk0p24: 3bdffe00 00000200 "system"
#mmcblk0p26: 0f000000 00000200 "cache"
#mmcblk0p25: 4cfffe00 00000200 "userdata"
#mmcblk0p28: 017ade00 00000200 "devlog"
#mmcblk0p30: 00040000 00000200 "pdata"
#mmcblk0p31: 46800000 00000200 "fat"
#mmcblk0p29: 00011c00 00000200 "extra"

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERDATAIMAGE_USES_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_BOOTIMAGE_PARTITION_SIZE := 16776192
BOARD_CACHEIMAGE_PARTITION_SIZE := 251658240
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 13104640
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1004535296
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1291845120
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk0p31
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk1p1
BOARD_SDEXT_DEVICE := /dev/block/mmcblk1p2
BOARD_SWAP_DEVICE := /dev/block/mmcblk1p3

# Vold
BOARD_VOLD_MAX_PARTITIONS := 31
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_USES_USB_MASS_STORAGE_SWITCH := true

# Wifi related definitions
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE                := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcm4330_b2.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcm4330_apsta_b2.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/vendor/firmware/fw_bcm4330_p2p_b2.bin"
WIFI_DRIVER_MODULE_NAME          := "bcmdhd"
WIFI_DRIVER_MODULE_ARG           := "firmware_path=/system/vendor/firmware/fw_bcm4330_b2.bin nvram_path=/proc/calibration iface_name=wlan0"
WIFI_BAND                        := 802_11_ABG
BOARD_LEGACY_NL80211_STA_EVENTS  := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_NEEDS_BLUETOOTH_INIT_DELAY := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/protou/bluetooth

# Qualcomm hardware
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_LIBS := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# Graphics
BOARD_EGL_CFG := device/htc/protou/prebuilt/system/lib/egl/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_QCOM_DISPLAY_VARIANT := legacy
BOARD_ADRENO_DECIDE_TEXTURE_TARGET := true
BOARD_USE_SKIA_LCDTEXT := true
TARGET_USES_GENLOCK := true
BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
TARGET_USES_PMEM := true
TARGET_USES_C2D_COMPOSITION := false
TARGET_QCOM_HDMI_OUT := false
TARGET_NO_HW_VSYNC := true
TARGET_USES_POST_PROCESSING := true
TARGET_USES_SF_BYPASS := false
TARGET_HAVE_BYPASS := false
TARGET_USES_GENLOCK := true
TARGET_USES_OVERLAY := true

# Camera
USE_CAMERA_STUB := false
TARGET_USES_QCOM_BSP := true
QCOM_BSP_CAMERA_ABI_HACK := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
BOARD_USES_QCOM_LEGACY_CAM_PARAMS := true
BOARD_CAMERA_HAVE_FLASH := true
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB -Dhtc_CAMERA_HARDWARE

# Video Devices
BOARD_V4L2_DEVICE := /dev/video1
BOARD_CAMERA_DEVICE := /dev/video0
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK -DQCOM_ICS_DECODERS -DQCOM_LEGACY_OMX

# RIL
BOARD_USES_NEW_LIBRIL_HTC := true
BOARD_USES_LEGACY_RIL := true

# Audio
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
BOARD_USES_SRS_TRUEMEDIA := true
TARGET_PROVIDES_LIBAUDIO := true

# GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := protou
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Webkit
ENABLE_WEBGL := true
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome
TARGET_FORCE_CPU_UPLOAD := true

# Keep Size in check
SMALLER_FONT_FOOTPRINT := true

# Boot animation
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Lights
TARGET_PROVIDES_LIBLIGHTS := true

# Touch screen compatibility for JB
BOARD_USES_LEGACY_TOUCHSCREEN := true

# HTCLOG
COMMON_GLOBAL_CFLAGS += -DHTCLOG

# USES this flag if the board has a ext4 partition larger than 2gb
BOARD_HAS_LARGE_FILESYSTEM := true
