{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./hardware/vm-aarch64-utm.nix
    ./vm-aarch64.nix
  ];
}
