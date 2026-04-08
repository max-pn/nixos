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
}
