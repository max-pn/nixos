{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./hardware/vm-aarch64-vmw.nix
    ./vm-aarch64.nix
  ];

  # Enable vmware guest tools
  virtualisation.vmware.guest.enable = true;
}
