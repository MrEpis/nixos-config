{ pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  home.username = "mrepis";
  home.homeDirectory = "/home/mrepis";

  # Noctalia Shell via son module officiel
  programs.noctalia = {
    enable = true;
    # settings = { ... }; # Laisser vide si tu préfères configurer via l'UI intégrée
  };

  # Dépendances Wayland utiles
  home.packages = with pkgs; [
    alacritty # ou kitty/foot
    wl-clipboard
    brightnessctl
    wireplumber
  ];

  # Configuration de Niri (spawn noctalia au démarrage)
  xdg.configFile."niri/config.kdl".text = ''
    // Lancement automatique de Noctalia au démarrage de la session Niri
    spawn-at-startup "noctalia"

    // Configuration des sorties (adaptable selon ton écran de PC portable)
    output "eDP-1" {
        scale 1.0
    }

    input {
        keyboard {
            xkb {
                layout "fr"
            }
        }
        touchpad {
            tap
            natural-scroll
        }
    }

    layout {
        gaps 12
        center-focused-column "never"
    }

    binds {
        Mod+Return { spawn "alacritty"; }
        Mod+Q { close-window; }
        Mod+Left  { focus-column-left; }
        Mod+Right { focus-column-right; }
        Mod+Shift+E { quit; }
    }
  '';

  home.stateVersion = "26.05";
}