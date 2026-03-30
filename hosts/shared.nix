{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [ ];

  # TODO: Shared configurations

  # enable flakes and other feature flags
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };
}
