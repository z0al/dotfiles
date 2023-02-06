# [yabai](https://github.com/koekeishiya/yabai)

Tiling window management for the Mac.

## How-Tos

### Disabling System Integrity Protection (SIP)

(Taken from [here](https://github.com/koekeishiya/yabai/wiki/Disabling-System-Integrity-Protection#how-do-i-disable-system-integrity-protection))

1. Turn off your device
2. Press and hold the power button on your Mac until “Loading startup options” appears.
   Click Options, then click Continue.
3. In the menu bar, choose `Utilities`, then `Terminal`.
4. Run `csrutil disable --with kext --with dtrace --with basesystem`
5. Reboot
6. Enable non-Apple-signed arm64e binaries by running `sudo nvram boot-args=-arm64e_preview_abi`
7. You can verify that System Integrity Protection is turned off by running `csrutil status`, which returns System Integrity Protection status: disabled. if it is turned off (it may show unknown for newer versions of macOS when disabling SIP partially).
