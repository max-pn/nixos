{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./hardware/vm-aarch64.nix
    ./shared.nix
  ];

  # TODO: Host configurations

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set hostname
  networking.hostName = "nixos";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # apply hypervisor auto-resizing fix
  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "xrandr-auto" ''
      xrandr --output Virtual-1 --auto
    '')

  ];
}
