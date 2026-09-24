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

  home.packages = with pkgs; [
    alacritty
    wl-clipboard
    brightnessctl
    wireplumber
    firefox
    neovim
    fuzzel
    bat
    lsd
    fastfetch
    vesktop
    spotify
    vscode
    docker
    jetbrains.idea
    jetbrains.webstorm
    python3Minimal
    jre_minimal
    gcc
    kdePackages.dolphin
    antigravity-cli
    elmPackages.nodejs
    gh
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      export PS1="%{%F{165}%}%n%{%F{171}%}@%{%F{213}%}%m %{%F{219}%}%1~ %{%f%}$ "

      fastfetch
    '';

    oh-my-zsh = {
      enable = true;
      theme = "alanpeabody";
      plugins = [
        "git"
        "sudo"
        "command-not-found"
      ];
    };

    shellAliases = {
      ll = "lsd -lah";
      nrsl = "sudo nixos-rebuild switch --flake .#larptop";
      nv = "nvim";
      ls = "lsd -l";
      cat = "bat";
      br0 = "brightnessctl -d \"tpacpi::kbd_backlight\" set 0";
      br2 = "brightnessctl -d \"tpacpi::kbd_backlight\" set 2";
    };

    loginExtra = ''
      if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ] then
        exec niri
      fi
    '';
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 13.0;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
      };

      window = {
        opacity = 0.95;
        padding = {
          x = 12;
          y = 12;
        };
        decorations = "None";
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };
      };
    };
  };  

  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "NixOS2";
        padding = {
          right = 2;
        };
      };
      display = {
        separator = " -> ";
      };
      modules = [
        {
          type = "os";
          key = "OS";
        }
        {
          type = "kernel";
          key = "Kernel";
        }
        {
          type = "uptime";
          key = "Uptime";
        }
        {
          type = "shell";
          key = "Shell";
        }
        {
          type = "memory";
          key = "Memory";
        }
        {
          type = "swap";
          key = "Swap";
        }
        {
          type = "disk";
          key = "Disk";
        }
        {
          type = "battery";
          key = "Battery";
        }
      ];
    };
  };

  xdg.configFile."niri/config.kdl".text = ''
    // Lancement automatique de Noctalia au démarrage de la session Niri
    spawn-at-startup "noctalia"

    // Configuration des sorties (adaptable selon ton écran de PC portable)
    output "eDP-1" {
        scale 1.0
    }


    prefer-no-csd

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
        gaps 6
        center-focused-column "never"
    }

    window-rule {
	match app-id="firefox"
	default-column-width { proportion 0.8; }
    }

    window-rule {
	match app-id="Alacritty"
	default-column-width { proportion 0.6; }
	draw-border-with-background false
    }

    window-rule {
	match app-id="vesktop"
	default-column-width { proportion 0.6; }
    }

    binds {
        Mod+Return { spawn "alacritty"; }
        Mod+Q { close-window; }
        Mod+Left  { focus-column-left; }
        Mod+Right { focus-column-right; }
	Mod+Up { focus-window-or-workspace-up; }
	Mod+Down { focus-window-or-workspace-down; }
        Mod+Shift+E { quit; }
	Mod+F { maximize-column; }
        Mod+Shift+F { fullscreen-window; }

        Mod+Space { spawn "fuzzel"; }
        Mod+B { spawn "firefox"; }

	Mod+Shift+Left { move-column-left; }
	Mod+Shift+Right { move-column-right; }
	Mod+Shift+Up { move-window-to-workspace-up; }
	Mod+Shift+Down { move-window-to-workspace-down; }


	XF86AudioRaiseVolume  allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+"; }
        XF86AudioLowerVolume  allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-"; }
        XF86AudioMute         allow-when-locked=true { spawn "wpctl" "set-mute"   "@DEFAULT_AUDIO_SINK@" "toggle"; }
        XF86AudioMicMute      allow-when-locked=true { spawn "wpctl" "set-mute"   "@DEFAULT_AUDIO_SOURCE@" "toggle"; }

        XF86MonBrightnessUp   allow-when-locked=true { spawn "brightnessctl" "set" "+5%"; }
        XF86MonBrightnessDown allow-when-locked=true { spawn "brightnessctl" "set" "5%-"; }

        XF86AudioPlay         allow-when-locked=true { spawn "playerctl" "play-pause"; }
        XF86AudioNext         allow-when-locked=true { spawn "playerctl" "next"; }
        XF86AudioPrev         allow-when-locked=true { spawn "playerctl" "previous"; }
      }
  '';

  home.stateVersion = "26.05";
}
