# Copyright (C) 2011 The Android Open Source Project
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

# Include protou's BoardConfig.mk
include device/htc/protou/BoardConfig.mk

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, device/htc/common/common.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

LOCAL_PATH := device/htc/protou
ifeq ($(protou_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(protou_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

DEVICE_PACKAGE_OVERLAYS += device/htc/protou/overlay

# Boot ramdisk setup
PRODUCT_PACKAGES += \
    fstab.protou \
    init.target.rc

# Boot ramdisk setup
PRODUCT_COPY_FILES += \
    device/htc/protou/ramdisk/sbin/sfc:root/sbin/sfc \
    device/htc/protou/ramdisk/fstab.protou:root/fstab.protou \
    device/htc/protou/ramdisk/init.qcom.sh:root/init.qcom.sh \
    device/htc/protou/ramdisk/init.target.rc:root/init.target.rc \
    device/htc/protou/ramdisk/init.target.recovery.rc:root/init.target.recovery.rc \
    device/htc/protou/ramdisk/init.usb.rc:root/init.usb.rc \
    device/htc/protou/ramdisk/ueventd.target.rc:root/ueventd.target.rc

# HTC blobs for recovery
PRODUCT_COPY_FILES += \
    device/htc/protou/recovery/sbin/choice_fn:recovery/root/sbin/choice_fn \
    device/htc/protou/recovery/sbin/detect_key:recovery/root/sbin/detect_key \
    device/htc/protou/recovery/sbin/offmode_charging:recovery/root/sbin/offmode_charging \
    device/htc/protou/recovery/sbin/power_test:recovery/root/sbin/power_test \
    device/htc/protou/recovery/sbin/rmt_storage:recovery/root/sbin/rmt_storage \
    device/htc/protou/recovery/sbin/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

# keylayouts
PRODUCT_COPY_FILES += \
    device/htc/protou/keylayout/himax-touchscreen.kl:system/usr/keylayout/himax-touchscreen.kl \
    device/htc/protou/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/protou/keylayout/projector-Keypad.kl:system/usr/keylayout/projector-Keypad.kl \
    device/htc/protou/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/htc/protou/keylayout/sr_touchscreen.kl:system/usr/keylayout/sr_touchscreen.kl \
    device/htc/protou/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl

# idc
PRODUCT_COPY_FILES += \
    device/htc/protou/idc/himax-touchscreen.idc:system/usr/idc/himax-touchscreen.idc \
    device/htc/protou/idc/projector_input.idc:system/usr/idc/projector_input.idc

# Custom media config for qcom camera
PRODUCT_COPY_FILES += \
    device/htc/protou/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/htc/protou/configs/media_codecs.xml:system/etc/media_codecs.xml

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/htc/protou/prebuilt/system,system)

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf
PRODUCT_PACKAGES += fstab.protou

## dsp Audio
PRODUCT_COPY_FILES += \
    device/htc/protou/dsp/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg \
    device/htc/protou/dsp/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    device/htc/protou/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/protou/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/protou/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/protou/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/protou/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg 

# HTC BT audio config
PRODUCT_COPY_FILES += device/htc/protou/configs/AudioBTID.csv:system/etc/AudioBTID.csv

# GPS config
PRODUCT_COPY_FILES += \
    device/htc/protou/configs/gps.conf:system/etc/gps.conf       

# Vold.fstab
PRODUCT_COPY_FILES += \
    device/htc/protou/configs/vold.fstab:system/etc/vold.fstab

# Wifi configuration files
PRODUCT_COPY_FILES += \
    device/htc/protou/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/htc/protou/configs/p2p_supplicant.conf:system/etc/wifi/p2p_supplicant.conf        

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Video
PRODUCT_PACKAGES += \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# Camera
PRODUCT_PACKAGES += \
    camera.msm7627a \
    camera.default \

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm7627a \
    gralloc.msm7627a \
    gralloc.default \
    hwcomposer.msm7627a \
    hwcomposer.default \
    libtilerenderer

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.msm7627a \
    audio.primary.msm7627a \
    audio.primary.default \
    audio_policy.default \
    audio.usb.default \
    libaudioutils

# GPS
PRODUCT_PACKAGES += \
    gps.default \
    gps.protou

# protou specific
PRODUCT_PACKAGES += \
    lights.default \
    lights.msm7627a \
    sensors.msm7627a \
    sensors.default 

# Power HAL
PRODUCT_PACKAGES += \
    power.msm7627a \
    power.default 

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    librs_jni

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

PRODUCT_COPY_FILES += \
    device/htc/protou/fstab.protou:root/fstab.protou

# cd_iso
PRODUCT_PACKAGES += \
    cdrom_install.iso 

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true
         
# Set usb type
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage,mtp \
    persist.service.adb.enable=1
   
# by us to enable booting into recovery after flashing boot.img
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1 

# Enabling video for live effects
include frameworks/base/data/videos/VideoPackage1.mk

# RIL
PRODUCT_COPY_FILES += \
    vendor/htc/protou/proprietary/lib/libhtc_ril.so:system/lib/libhtc_ril.so \

PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=45

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
	media.aac_51_output_enabled=true

# Set build date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    ro.com.google.locationfeatures=1 \
    dalvik.vm.dexopt-flags=m=y \
    ro.vold.umsdirtyratio=20 

# enable overlays to use our version of
# source/resources etc.
PRODUCT_PACKAGE_OVERLAYS := device/qcom/common/overlay

# include additional build utilities
-include device/qcom/common/utils.mk

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

PRODUCT_PRIVATE_KEY := device/qcom/common/qcom.key

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += de_DE

# call the proprietary setup
$(call inherit-product-if-exists, vendor/htc/protou/protou-vendor.mk)

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)
