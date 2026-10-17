#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 The TWRP Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_COMMON_NAME := sm8550-common

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/$(PRODUCT_COMMON_NAME)/common.mk)

# The two QCA Wi-Fi drivers stall recovery and are not needed there.
# Each device selects a full first-stage module load list below.
PRODUCT_COPY_FILES += $(filter-out \
    %/lib/modules/modules.load.recovery \
    %/lib/modules/qca_cld3_kiwi_v2.ko \
    %/lib/modules/qca_cld3_qca6490.ko, \
    $(call find-copy-subdir-files,*,device/samsung/$(PRODUCT_COMMON_NAME)/recovery/root,recovery/root))
