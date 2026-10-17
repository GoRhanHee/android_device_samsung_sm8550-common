$(call inherit-product, device/samsung/sm8550-common/twrp_sm8550.mk)

PRODUCT_COPY_FILES += \
    device/samsung/sm8550-common/prebuilt/q5q/tsp_stm/fst2ba61y_q5.bin:recovery/root/vendor/firmware_mnt/image/tsp_stm/fst2ba61y_q5.bin \
    device/samsung/sm8550-common/prebuilt/q5q/tsp_stm/fst2ca78y_q5.bin:recovery/root/vendor/firmware_mnt/image/tsp_stm/fst2ca78y_q5.bin \
    device/samsung/sm8550-common/prebuilt/q5q/tsp_stm/fst3ca60y_q5.bin:recovery/root/vendor/firmware_mnt/image/tsp_stm/fst3ca60y_q5.bin
