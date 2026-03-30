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
  userHomeConfig = ../users/${user}/home.nix;

  # Choose correct nix builder function for darwin or nixos
  systemFunc = if darwin then inputs.darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;

  # Choose correct home-manager module for darwin or nixos
  home-manager =
    if darwin then inputs.home-manager.darwinModules else inputs.home-manager.nixosModules;
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
    home-manager.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = import userHomeConfig;
    }
    {
      config._module.args = {
        currentSystem = system;
        currentSystemName = name;
        currentSystemUser = user;
      };
    }
  ];
}
