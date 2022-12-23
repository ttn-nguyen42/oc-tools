#!/bin/bash

# Root directory
root_dir=$(pwd)

# USB EFI directory
x64_dir="$root_dir/X64"
efi_dir="$x64_dir/EFI"

# Location of the MacOS packages installers
macos_pkg_dir="$root_dir/Utilities/macrecovery"

get_package() {
    if [ "$1" == "sur" ]
    then
        echo "Downloading Big Sur packages"
        # Big Sur
        python3 $macos_pkg_dir/macrecovery.py -b Mac-42FD25EABCABB274 -m 00000000000000000 download

    elif [ "$1" == "monterey" ]
    then
        echo "Downloading Monterey packages"
        # Monterey
        python3 $macos_pkg_dir/macrecovery.py -b Mac-42FD25EABCABB274 -m 00000000000000000 download
    else
        echo "Recovery image not specified"
        echo "Options: sur | monterey"
        exit 10
    fi
    # Move package to root directory
    mkdir -p $root_dir/recovery_$1

    mv $root_dir/com.apple.recovery.boot $root_dir/recovery_$1
    echo "Recovery image downloaded"
}

add_efi() {
    if [ -z "$1" ]; then
        echo "Missing the path for USB drive letter"
        exit 10
    fi
    usb_dir="/mnt/$1"
}

open_plist() {
    if [ -z "$1" ]; then
        echo "Missing the path for config.plist"
    fi
}

get_tools() {
    echo "Unimplemented"
}

# Options
case "$1" in
get-package)
    get_package "$2"
    ;;
add-efi)
    add_efi "$2"
    ;;
plist)
    open_plist "$2"
    ;;
get-tools)
    get_tools
    ;;
*)
    echo "Help"
    echo "$0 get-package [sur | monterey]"
    echo "$0 get-tools"
    echo "$0 add-efi [path]"
    echo "$0 open-plist [path]"
    exit 10
    ;;
esac

exit $?
