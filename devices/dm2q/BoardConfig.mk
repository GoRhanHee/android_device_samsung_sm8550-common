DEVICE_PATH := device/samsung/dm2q
COMMON_PATH := device/samsung/sm8550-common

TARGET_PREBUILT_DTB := $(COMMON_PATH)/prebuilt/dm2q/dtb
BOARD_PREBUILT_DTBOIMAGE := $(COMMON_PATH)/prebuilt/dm2q/recovery_dtbo
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 109051904

include $(COMMON_PATH)/BoardConfigCommon.mk
