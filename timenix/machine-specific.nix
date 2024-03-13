# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  boot.initrd.luks.devices."luks-6f91acd4-b846-4c17-8d46-fa68486c957f".device = "/dev/disk/by-uuid/6f91acd4-b846-4c17-8d46-fa68486c957f";
  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };

  boot.loader.grub.enableCryptodisk=true;

  boot.initrd.luks.devices."luks-c39762f6-1e18-459b-9f7f-dc4793a88e66".keyFile = "/crypto_keyfile.bin";
  boot.initrd.luks.devices."luks-6f91acd4-b846-4c17-8d46-fa68486c957f".keyFile = "/crypto_keyfile.bin";
  networking.hostName = "timenix"; # Define your hostname.
}
