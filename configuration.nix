{ pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Réseau & Audio
  networking.networkmanager.enable = true;
  networking.hostName = "larptop";

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Activation native de Niri
  programs.niri.enable = true;

  # Polices et backend graphique
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  # Utilisateur principal
  users.users.mrepis = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "input" ];
  };

  system.stateVersion = "26.05";
}