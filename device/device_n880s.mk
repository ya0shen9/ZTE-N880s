# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

#$(call inherit-product, device/common/gps/gps_cn_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/zte/n880s/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := zte_n880s
PRODUCT_DEVICE := n880s
PRODUCT_MODEL := ZTE-C N880s

#add Gallery3D by shenqi 1214
PRODUCT_PACKAGES += \
    librs_jni \
    gralloc.n880s \
    copybit.n880s \
    libcamera \
    gps.n880s \
    sensors.n880s \
    libOmxCore \
    libOmxVidEnc \
    abtfilt \
    prox_cal \
    dexpreopt \
    LeWaFM \

#    Gallery3D \
#    Term \
#    LiveWallpapers \
#    LiveWallpapersPicker \
#    VisualizationWallpapers \
#    MagicSmokeWallpapers \
#    VisualizationWallpapers \
#    SpareParts \
#    Development \
#    BladeParts \

# proprietary side of the device
$(call inherit-product-if-exists, vendor/zte/n880s/n880s-vendor.mk)

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/zte/n880s/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/zte/n880s/blade_keypad.kcm.bin:system/usr/keychars/blade_keypad.kcm.bin \
    device/zte/n880s/blade_keypad.kl:system/usr/keylayout/blade_keypad.kl

# fstab
PRODUCT_COPY_FILES += \
    device/zte/n880s/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/zte/n880s/init.blade.rc:root/init.blade.rc \
    device/zte/n880s/prebuilt/usbconfig:root/sbin/usbconfig \
    device/zte/n880s/ueventd.blade.rc:root/ueventd.blade.rc
#    device/zte/n880s/init:root/init \
#    device/zte/n880s/adbd:root/sbin/adbd \


# Handset
PRODUCT_COPY_FILES += \
    device/zte/n880s/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/zte/n880s/AVRCP.kl:system/usr/keylayout/AVRCP.kl

# Audio
PRODUCT_COPY_FILES += \
    device/zte/n880s/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/zte/n880s/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/zte/n880s/init.bt.sh:system/etc/init.bt.sh \
    device/zte/n880s/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/n880s/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf 

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

#    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/zte/n880s/prebuilt/cifs.ko:system/lib/modules/2.6.35.7-perf+/cifs.ko \
    device/zte/n880s/prebuilt/zram.ko:system/lib/modules/2.6.35.7-perf+/zram.ko \
    device/zte/n880s/prebuilt/dhd.ko:system/lib/modules/dhd.ko \
    device/zte/n880s/prebuilt/cpaccess.ko:system/lib/modules/cpaccess.ko \
    device/zte/n880s/prebuilt/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
    device/zte/n880s/prebuilt/oprofile.ko:system/lib/modules/oprofile.ko \
    device/zte/n880s/prebuilt/ramzswap.ko:system/lib/modules/ramzswap.ko \
    device/zte/n880s/prebuilt/reset_modem.ko:system/lib/modules/reset_modem.ko \
    device/zte/n880s/prebuilt/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/zte/n880s/prebuilt/dma_test.ko:system/lib/modules/dma_test.ko

#WiFi firmware
PRODUCT_COPY_FILES += \
    device/zte/n880s/firmware/BCM4329B1_002.002.023.0735.0754.hcd:system/etc/BCM4329B1_002.002.023.0735.0754.hcd \
    device/zte/n880s/firmware/fw_4329_apsta.bin:system/etc/fw_4329_apsta.bin \
    device/zte/n880s/firmware/fw_4329.bin:system/etc/fw_4329.bin \
    device/zte/n880s/firmware/nv_4329.txt:system/etc/nv_4329.txt \
    device/zte/n880s/firmware/fw_4319.bin:system/etc/fw_4319.bin \
    device/zte/n880s/firmware/fw_4319_apsta.bin:system/etc/fw_4319_apsta.bin \
    device/zte/n880s/firmware/nv_4319.txt:system/etc/nv_4319.txt

#Media profile
#PRODUCT_COPY_FILES += \
#    device/zte/n880s/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=120 \
    ro.com.android.dataroaming=false

# Blade only use two language for lewa branch
PRODUCT_LOCALES := zh_CN en_US zh_TW

# Blade uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=240 

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \
    ro.build.baseband_version=N880B01 \
    ro.telephony.default_network=4 \
    ro.telephony.call_ring.multiple=false \
    ro.config.cdma_subscription=0 \
    ril.subscription.types=RUIM,NV \
    ro.cdma.home.operator.numeric=46003 \
    ro.cdma.home.operator.alpha=中国电信 \
    persist.sys.timezone=Asia/Shanghai

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072  \
    ro.compcache.default=0

PRODUCT_PROPERTY_OVERRIDES += \
    ro.lewa.swapper.part_path=/dev/block/mmcblk0p3

# add for error report  by shenqi
PRODUCT_PROPERTY_OVERRIDES += \
    ro.error.receiver.system.apps=com.android.systemui

# copy default lockscreen theme by shenqi 2011-12-29
PRODUCT_COPY_FILES += \
    lewa/frameworks/lockscreen/WVGA/lockscreen.zip:/system/media/lockscreen.zip \
    lewa/frameworks/theme/WVGA/default.lwt:/system/media/default.lwt

# added by ioz9 2012-03-03
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hwfeature_wakeupkey=3 \
    ro.config.hw_menu_unlockscreen=true \
    ro.camera.intrplt.2mpto3mp=true

# Perfomance tweaks by ioz9
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=48m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.sf.hwrotation=180 \
    debug.sf.hw=1 \
    windowsmgr.max_events_per_sec=120 \
    video.accelerate.hw=1 \
    debug.composition.type=gpu \
    debug.performance.tuning=1
