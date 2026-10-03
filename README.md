# NixOS Dotfiles

Personal NixOS configuration using **Nix Flakes** and **Home Manager**.

Currently, it’s only configured for my laptop (named `larptop`), but moving my desktop to NixOS is planned. Thus, this config has been made with that goal in mind.

## System Overview

* **OS:** NixOS (using `nixos-unstable`)

* **Window Manager:** [Niri](https://github.com/YaLTeR/niri) 

* **Shell & Bar:** [Noctalia](https://github.com/noctalia-dev/noctalia) shell

* **Display Manager / Greeter:** `greetd` with `tuigreet`

* **Locale & Keyboard Layout:** English and French locales, as well as French keyboard layout and French dictionaries 

* **Terminal:** Alacritty

* **Shell:** Zsh (with Oh My Zsh, autosuggestions, syntax highlighting, and Fastfetch)

* **App Launcher:** Fuzzel (custom purple / mauve theme)

* **Editor:** Neovim (basic config with Catppuccin Mocha theme, hybrid line numbers, Lualine)

* **Gaming:** Steam enabled with required firewall ports

## Repository Structure

```
.
├── flake.nix                       # Flake entry point (hosts & dependencies)
├── flake.lock                      # Pinned dependencies lockfile
├── hosts/
│   ├── larptop/                    # Laptop configuration
│   │   ├── default.nix             # Laptop-specific options (hostName, battery/power)
│   │   └── hardware-configuration.nix
│   └── desktop/                    # (Planned) Desktop workstation
└── modules/
    ├── nixos/                      # Shared system-level configurations
    │   ├── core.nix                # Bootloader, locales, user accounts, base packages
    │   ├── desktop.nix             # Niri, Greetd, graphics, fonts, audio
    │   └── gaming.nix              # Steam configuration
    └── home-manager/               # Shared user-level configurations
        ├── default.nix             # User packages, MIME associations
        ├── shell.nix               # Zsh, Direnv, Fastfetch configuration
        ├── terminal.nix            # Alacritty configuration
        ├── neovim.nix              # Neovim, plugins, Catppuccin theme
        └── wm/
            └── niri.nix            # Niri layout, keybindings, and rules

```

## Theme & Appearance

The desktop environment uses a coherent purple/mauve color palette across components:

* **Fuzzel:** Custom purple background with lavender search matching and borders.

* **Fastfetch:** Violet/lavender NixOS logo and mauve data keys.

* **Neovim:** Catppuccin Mocha colorscheme with relative line numbering and custom statusline.

* **Terminal:** JetBrainsMono Nerd Font and 95% background opacity.

* **Noctalia:** Custom bar and appearance made in the GUI, so it's not present in this repo (yet)

## LLM Usage Notice

This config contains LLM-generated text. However, I have only ever used AI to speed up the writing of configurations. 99% of decisions have been made by me, and I have always double-checked every line written by an LLM. This README that you are reading right now has been initially written by an LLM but I heavily edited it.
