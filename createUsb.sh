#!/bin/bash

# USB EFI directory
usb_efi_dir="$1"
64_dir="$1/X64"
efi_dir="$1/x64/EFI"

# Location of MacOS packages
macos_pkg_dir="$2"
basesystem_chunklist="$2/BaseSystem.chunklist"
basesystem_dmg="$2/BaseSystem.dmg"