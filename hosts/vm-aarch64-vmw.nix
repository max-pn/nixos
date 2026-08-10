{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:

let
  hyprlandVmwgfxPatched = pkgs.hyprland.overrideAttrs (old: {
    patches = (old.patches or [ ]) ++ [
      ../patches/hyprland-vmwgfx-dmabuf-workaround.patch
    ];
  });
in
{
  imports = [
    ./hardware/vm-aarch64-vmw.nix
    ./vm-aarch64.nix
    inputs.clipway.nixosModules.default
  ];

  # Enable vmware guest tools
  virtualisation.vmware.guest.enable = true;

  # apply hyprland patch (2026-04-10)
  programs.hyprland = {
    enable = true;
    package = hyprlandVmwgfxPatched;
  };

  # apply open-vm-tools clipway patch
  #
  # WARN: this is an unofficial community patch actively briding
  # the host<->guest clipboard
  # do not use in high-risk enviornment to prevent secret leakage
  #
  # FIX: this is only necessary because wayland is not yet offically
  # supported by vm-guest-tools.
  services.clipway = {
    enable = true;
    target = "hyprland-session.target";
  };
}
