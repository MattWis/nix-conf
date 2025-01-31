{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "timelin"; # Define your hostname.

  fileSystems."/home/mwismer/Mount/Sync" = {
    device = "/dev/sdb1";
    fsType = "ext4";
  };
}
