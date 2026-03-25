{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./hardware/vm-aarch64-prl.nix
    ./vm-aarch64.nix
  ];
}
