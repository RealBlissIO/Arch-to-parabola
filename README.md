# Arch-to-Parabola Migration Script

This script facilitates the migration of your Arch Linux installation to Parabola GNU/Linux-libre. It downgrades all packages to their versions available in the Parabola repositories and replaces any non-free software with free alternatives.

## Disclaimer

This script is provided as-is, without any warranty or guarantee. Use it at your own risk. It is recommended to review and understand the script before running it on your system.

## Prerequisites

Before running this script, ensure that you have access to the root password or a tool that allows you to elevate privileges, such as:

- `sudo`
- `doas`
- Direct root access (`su`)

## Usage

1. Ensure that you meet the prerequisites mentioned above.
2. Run the script with root privileges.
3. The script will perform the following steps:
   - Update your system to the latest packages.
   - Install Parabola keyrings and mirror list.
   - Configure `pacman` to include the Parabola repositories.
   - Check if systemd is in use and adjust `pacman.conf` accordingly.
   - Clean the package cache and refresh the keyring.
   - Install Parabola packages, downgrading any non-free software.
   - Update the bootloader configuration (GRUB).
4. After successful execution, your system will be migrated to Parabola.

## Troubleshooting

If you encounter any issues during the migration process, please refer to the [Parabola Migration Wiki](https://wiki.parabola.nu/Migration_from_Arch) for possible resolutions.

## Credits

This script is based on the guidelines provided by the [Parabola Migration Wiki](https://wiki.parabola.nu/Migration_from_Arch). If you have any problems, visit the wiki for additional information.


