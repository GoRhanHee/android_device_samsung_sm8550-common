DEVICE_PATH := device/samsung/q5q
COMMON_PATH := device/samsung/sm8550-common

TARGET_PREBUILT_DTB := $(COMMON_PATH)/prebuilt/q5q/dtb
BOARD_PREBUILT_DTBOIMAGE := $(COMMON_PATH)/prebuilt/q5q/recovery_dtbo
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 109576192
TW_ROTATION := 270

include $(COMMON_PATH)/BoardConfigCommon.mk
