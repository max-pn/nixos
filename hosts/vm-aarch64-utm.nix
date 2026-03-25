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

  environment.systemPackages = with pkgs; [
    spice-vdagent
  ];

  # Enable the QEMU Guest Agent
  services.qemuGuest.enable = true;

  # QEMU supporting resizing
  services.spice-vdagentd.enable = true;
}
