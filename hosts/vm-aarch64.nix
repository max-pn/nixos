{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./shared.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable cross-compile
  boot.binfmt.emulatedSystems = [ "x86_64-linux" ];

  # Set hostname
  networking.hostName = "nixos";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Locales
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # Keyboard layout
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "intl";
    };
  };

  # disable user mutation
  users.mutableUsers = false;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = true;
  services.openssh.settings.PermitRootLogin = "no";

  # System-wide packages
  environment.systemPackages = with pkgs; [
    git
    gnumake
    vim
  ];

  # Enable Docker
  virtualisation.docker.enable = true;

  # Enable X11 windowing system
  #services.xserver.enable = true;

  # Enable gdm as login manager
  #services.displayManager.gdm.enable = true;

  # Enable gnome desktop enviornment
  #services.desktopManager.gnome.enable = true;

  # Enable hyprland desktop enviornment
  programs.hyprland = {
    enable = true;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # OpenCL + mesa support in hyprland
  hardware.graphics.enable = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?
}
