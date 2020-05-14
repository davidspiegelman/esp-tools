# esp-tools
**EFI System Partition Tools**

An AppleScript to mount/unmount EFI System Partion (ESP).

**toggle-esp** - mounts/unmounts your boot disk's hidden EFI partition. The script works with both HFS Plus and APFS formatted disks. The script determines the identity of your boot disk automatically and requires no interaction whatsoever therefor making it the fastest way to view your EFI partition (require's macOS 10.10.x and higher.) **UPDATE:** Starting with macOS 10.13.6, an administrator password is required for mounting the efi partition.

### Setup/config:

1. Move the esp-tools folder and its contents to `~/Library/Scripts/`
2. Enable the [Systemwide Script Menu][] if it is not already enabled

### Usage:

Simply select the script from the script menu.

[Systemwide Script Menu]: https://developer.apple.com/library/content/documentation/LanguagesUtilities/Conceptual/MacAutomationScriptingGuide/UsetheSystem-WideScriptMenu.html
