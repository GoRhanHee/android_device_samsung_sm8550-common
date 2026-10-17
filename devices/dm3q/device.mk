$(call inherit-product, device/samsung/sm8550-common/twrp_sm8550.mk)

PRODUCT_COPY_FILES += \
    device/samsung/sm8550-common/devices/dm3q/modules.load.recovery:recovery/root/lib/modules/modules.load.recovery
