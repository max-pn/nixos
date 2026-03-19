# This function creates a NixOS system based on given name and user
{
  nixpkgs,
  inputs,
}:

name:

{
  system,
  user,
  darwin ? false,
  wsl ? false,
  allowUnfree ? true,
  allowUnsupported ? true,
}:

let
  isWSL = wsl;

  machineConfig = ../hosts/${name}.nix;
  userOSConfig = ../users/${user}/${if darwin then "darwin" else "nixos"}.nix;

  # Choose correct nix builder function for darwin or nixos
  systemFunc = if darwin then inputs.darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;
in
systemFunc {
  inherit system;

  # assemble configuration modules
  modules = [

    # Allow unfree packages.
    { nixpkgs.config.allowUnfree = allowUnfree; }

    # Allow unsupported packages.
    # NOTE: there are numerous packages claiming no support for aarch64 while they work in fact
    { nixpkgs.config.allowUnsupportedSystem = allowUnsupported; }

    # Add WSL module if build is for wsl system
    (if isWSL then inputs.nixos-wsl.nixosModules.wsl else { })

    machineConfig
    userOSConfig

    {
      config._module.args = {
        currentSystem = system;
        currentSystemName = name;
        currentSystemUser = user;
      };
    }
  ];
}
