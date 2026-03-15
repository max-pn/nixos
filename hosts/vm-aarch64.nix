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

  # Set hostname
  networking.hostName = "nixos";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

}
