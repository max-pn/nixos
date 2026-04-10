{
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
  ];

  # Enable vmware guest tools
  virtualisation.vmware.guest.enable = true;

  # apply hyprland patch (2026-04-10)
  programs.hyprland = {
    enable = true;
    package = hyprlandVmwgfxPatched;
  };
}
