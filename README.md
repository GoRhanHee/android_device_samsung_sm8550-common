# Samsung SM8550 TWRP device trees

This repository keeps the shared recovery configuration and the device profiles
for `dm1q`, `dm2q`, `dm3q`, and `q5q` together. `b5q` is not configured yet.

| Device | Recovery partition size | Device-specific inputs |
| --- | ---: | --- |
| `dm1q` | 109051904 | `prebuilt/dm1q/dtb`, `prebuilt/dm1q/recovery_dtbo` |
| `dm2q` | 109051904 | `prebuilt/dm2q/dtb`, `prebuilt/dm2q/recovery_dtbo` |
| `dm3q` | 109051904 | `prebuilt/dm3q/dtb`, `prebuilt/dm3q/recovery_dtbo` |
| `q5q` | 109576192 | `prebuilt/q5q/dtb`, `prebuilt/q5q/recovery_dtbo`, touch firmware |

Each profile under `devices/` supplies its own `BoardConfig.mk` and product
makefiles. The profiles inherit `BoardConfigCommon.mk` and `twrp_sm8550.mk`,
which contain the shared kernel, modules, fstab, and recovery resources. Only
the `q5q` product copies the three `prebuilt/q5q/tsp_stm/*.bin` files into its
recovery ramdisk.

The shared `prebuilt/Image` and all 540 files in `recovery/root/lib/modules`
match the `vanilla-oneui` ZIP from the
[v2026.10.16 kernel release](https://github.com/GoRhanHee/android_kernel_samsung_sm8550/releases/tag/v2026.10.16).

## Build with GitHub Actions

Run **Build TWRP recovery** manually. Its matrix builds the four products
independently on GitHub-hosted Ubuntu 22.04 runners and uploads `recovery-dm1q`,
`recovery-dm2q`, `recovery-dm3q`, and `recovery-q5q` artifacts. Each artifact
contains `recovery.img` and an Odin-ready `.img.tar` containing
`recovery.img.lz4`. The workflow does not flash devices or package a single
auto-selecting installer ZIP.

The workflow frees runner disk space, installs Android build dependencies,
Java 11, and `repo`, then initializes the
[TWRP 12.1 minimal manifest](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp)
and syncs sources before building. It follows the hosted-runner setup in
[Action-Recovery-Builder](https://github.com/richter-coding-888/Action-Recovery-Builder/blob/ui9/.github/workflows/build.yml)
and runs only through `workflow_dispatch`.

## Local source layout

Check this repository out as `device/samsung/sm8550-common` in a TWRP 12.1
source tree, then run:

```bash
bash device/samsung/sm8550-common/scripts/link-device-trees.sh
```

The script links the four profiles as `device/samsung/<codename>` and refuses
to replace an existing device tree. Add the
[`device/qcom/twrp-common`](https://github.com/TeamWin/android_device_qcom_twrp-common)
dependency before selecting `twrp_<codename>-eng` and building
`recoveryimage`.

## q5q touch firmware

The three touch firmware files came from
[`richter-coding-888/android_device_samsung_q5q`](https://github.com/richter-coding-888/android_device_samsung_q5q/tree/5fe28fe8b865f77d62d18de9b6925ba2573e4c20/recovery/root/vendor/firmware_mnt/image/tsp_stm).
The shared `init.recovery.qcom.rc` mounts `apnhlos` at
`/vendor/firmware_mnt`; a successful mount hides ramdisk files under that
directory. Check firmware visibility and touch input on a q5q device before
relying on this recovery image.

The AVB digest patch is credited to [Hunter](https://github.com/devhunter1).

