# TWRP build for gale/gust Android 15 (experiment!)
> Unofficial TWRP recovery for Redmi 13c/poco c65 devices running Android 15. TESTING ONLY!

![Device](https://img.shields.io/badge/device-gale/gust-orange)
![Android](https://img.shields.io/badge/Android-15-green)
![Project](https://img.shields.io/badge/project-UNOFFICIAL-blue)
<p align="center">
  <img src="https://fdn2.gsmarena.com/vv/pics/xiaomi/xiaomi-redmi-13c-3.jpg" width="125">
  <img src="https://fdn2.gsmarena.com/vv/pics/xiaomi/xiaomi-poco-c65-2.jpg" width="140">
</p>

---

## 🕒 Status & Progress

**Status**

> 05,01,26 👀

**Checklist**

- [x] Gather all required materials
- [x] Sync TWRP source
- [x] Integrate device tree ([gamerbom97](https://github.com/gamerbom97/android_device_xiaomi_gale) Thank you for this 😇 )
- [ ] Build & test
- [ ] Public release

**Feature Progress**

- [ ] Recovery boots successfully
- [ ] ADB connectivity
- [ ] Data partition mounting
- [ ] FBE decryption (Android 15)
- [ ] Backup & restore
- [ ] MTP file transfer
- [ ] Brightness control
- [ ] Vibration feedback

---

## 🔧 Installation

> ⚠️ **Proceed at your own risk.** Flashing custom recovery may cause a bootloop. Make sure you understand each step before continuing.

1. Download the latest release from [Releases](https://github.com/NanRezz17/android_device_xiaomi_gale-gust_twrp/releases)
2. Download [Android Platform Tools](https://developer.android.com/tools/releases/platform-tools)
3. Boot into fastboot mode:
   ```bash
   adb reboot bootloader
   ```
4. Flash the recovery:
   ```bash
   fastboot flash recovery twrp.img
   ```
5. Reboot into recovery:
   ```bash
   fastboot reboot recovery
   ```

> 💡 If you encounter a bootloop, flash your stock recovery image to restore.

---

## 👏 Credits
 
- Device tree by: [gamerbom97](https://github.com/gamerbom97/android_device_xiaomi_gale)
- Creator of TWRP: [TeamWin Recovery Project](https://github.com/TeamWin)
- Source code by: [minimal-manifest-twrp](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp)

---
<p align="center">
Original source licensed under GPL v3, and Team Win LLC © 2026.
<p align="center">
  
`This is an unofficial project. All TWRP-related assets remain the property of Team Win LLC. Original source licensed under GPL v3 © 2026.`
