# OnePlus Nord CE4 Lite 5G (camry) OrangeFox device tree

## Working

- [x] Display
- [x] Touch
- [x] Decryption
- [x] Vibration
- [x] MTP/OTG Storage
- [x] ADB/FastbootD

## Untested

- [ ] Flashing
- [ ] Backup & Restore
- [ ] Factory Reset
- [ ] Flashlight
- [ ] KernelSU, KernelSU Next & SukiSU Ultra Installer

## How to build

### Clone and sync the source

```bash
mkdir -p ~/android/OrangeFox_14
cd ~/android/OrangeFox_14
git clone https://gitlab.com/OrangeFox/sync.git
cd sync
./orangefox_sync.sh --branch 14.1 --path ~/android/fox_14.1
```

### Clone the device tree

```bash
cd ~/android/fox_14.1/device
mkdir -p oneplus
cd oneplus
git clone --branch 16.0 https://github.com/koaaN/twrp_device_oneplus_camry.git camry
```

### Build

```bash
cd ~/android/fox_14.1
source build/envsetup.sh
lunch twrp_camry-eng
mka adbd recoveryimage
```
