# esp-tools
**EFI System Partition Tools**

Two AppleScripts to assist with general ESP maintenance.

**toggle-esp** - mounts/unmounts your boot disk's hidden EFI partition. The script works with both HFS Plus and APFS formatted disks. The script determines the identity of your boot disk automatically and requires no interaction whatsoever therefor making it the fastest way to view your EFI partition (require's macOS 10.10.x and higher.)

**update-apfs-driver** - uses the above script to mount the ESP and then copies `apfs.efi` from `/usr/standalone/i386/` to `/Volumes/EFI/EFI/CLOVER/drivers64UEFI/` (require's macOS 10.13.x and higher.)

### Setup/config:

1. Move the esp-tools folder and its contents to `~/Library/Scripts/`
2. Enable the [Systemwide Script Menu][] if it is not already enabled

### Usage:

Simply select the script from the script menu.

[Systemwide Script Menu]: https://developer.apple.com/library/content/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/UsetheSystem-WideScriptMenu.html
