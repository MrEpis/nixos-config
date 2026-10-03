{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/core.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/gaming.nix
  ];

  networking.hostName = "larptop";

  powerManagement.enable = true;
  services.tlp.enable = true;
  services.thermald.enable = true;
  services.upower.enable = true;
}
