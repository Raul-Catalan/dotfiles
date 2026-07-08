# NixOS + Flake + Home Manager + Hyprland Configuration
Hello, my name is Raul Catalan, this is my NixOS config using flakes and home manager.

## Structure

```
.
├── common                             # shared stuff
│   ├── base.nix
│   └── desktop.nix
├── flake.lock
├── flake.nix                          # main entry point
├── home                               # Home-manager configuration for all machines
│   ├── default.nix
│   ├── hyprland.nix
│   ├── shell.nix
│   ├── waybar.nix
│   └── zeus.nix
└── hosts
    ├── hermes
    │   ├── configuration.nix          # Laptop System-wide Config
    │   └── hardware-configuration.nix # ThinkPad Carbon X1
    └── zeus
        ├── configuration.nix          # PC System-Wide Config
        └── hardware-configuration.nix # AMD + NVIDIA
```
