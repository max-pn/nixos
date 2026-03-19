{
  config,
  pkgs,
  lib,
  currentSystemUser,
  ...
}:

{
  imports = [
    ./shared.nix
  ];

  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    defaultUser = currentSystemUser;
  };
}
