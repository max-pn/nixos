{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./shared.nix
  ];

  # TODO: Host configurations

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable cross-compile
  boot.binfmt.emulatedSystems = [ "x86_64-linux" ];

  # Set hostname
  networking.hostName = "nixos";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Enable X11 windowing system
  services.xserver.enable = true;

  # Enable gdm as login manager
  services.displayManager.gdm.enable = true;

  # Enable gnome desktop enviornment
  services.displayManager.gnome.enable = true;

  # Enable hyprland desktop enviornment
  programs.hyprland.enable = true;
}
