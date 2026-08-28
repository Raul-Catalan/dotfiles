# NixOS + Flake + Home Manager + Hyprland Configuration
Hello, my name is Raul Catalan, this is my NixOS config using flakes and home manager.

## Structure

```
.
├── CLAUDE.md
├── flake.lock
├── flake.nix
├── home
│   ├── hermes.nix
│   ├── wsl.nix
│   └── zeus.nix
├── hosts
│   ├── hermes
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   ├── wsl
│   │   └── configuration.nix
│   └── zeus
│       ├── configuration.nix
│       └── hardware-configuration.nix
├── modules
│   ├── home
│   │   ├── anki.nix
│   │   ├── cli
│   │   │   ├── bash.nix
│   │   │   ├── default.nix
│   │   │   ├── fish.nix
│   │   │   ├── github.nix
│   │   │   ├── git.nix
│   │   │   ├── helix.nix
│   │   │   ├── nh.nix
│   │   │   ├── starship.nix
│   │   │   ├── taskwarrior.nix
│   │   │   ├── tmux.nix
│   │   │   └── yazi.nix
│   │   ├── ghostty.nix
│   │   ├── hypr
│   │   │   ├── autostart.nix
│   │   │   ├── binds.nix
│   │   │   ├── environments.nix
│   │   │   ├── environments_nvidia.nix
│   │   │   ├── general.nix
│   │   │   ├── hyprland.nix
│   │   │   ├── monitors.nix
│   │   │   └── rules.nix
│   │   ├── noctalia.nix
│   │   ├── nvf.nix
│   │   └── vscode.nix
│   ├── nixos
│   │   ├── desktop
│   │   │   └── default.nix
│   │   ├── hardware
│   │   │   ├── amdcpu.nix
│   │   │   └── nvidia.nix
│   │   ├── system
│   │   │   ├── audio.nix
│   │   │   ├── bootloader.nix
│   │   │   ├── default.nix
│   │   │   ├── fonts.nix
│   │   │   └── nix-ld.nix
│   │   └── virtualisation
│   │       └── docker.nix
│   └── templates
│       ├── npm.nix
│       ├── python.nix
│       ├── rust.nix
│       └── start-tmux-astro.fish
└── README.md
```
