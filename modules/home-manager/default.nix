{ pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
    ./shell.nix
    ./terminal.nix
    ./wm/niri.nix
  ];

  home.username = "mrepis";
  home.homeDirectory = "/home/mrepis";

  programs.noctalia.enable = true;

  home.packages = with pkgs; [
    wl-clipboard
    wireplumber
    firefox
    neovim
    fuzzel
    bat
    lsd
    vesktop
    spotify
    vscode
    docker
    jetbrains.idea
    jetbrains.webstorm
    python3Minimal
    jre_minimal
    gcc
    antigravity-cli
    elmPackages.nodejs
    gh
    libnotify
    btop
    wdisplays
    nautilus
    sushi
    ffmpegthumbnailer
    playerctl
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
    };
  };

  home.stateVersion = "26.05";
}
