{lib, pkgs, ... }:
{
  # Declarative dotfiles
  imports = [
    <home-manager/nixos>
    ./networking.nix
    ./fonts.nix
    ./docker.nix
    ./kitty.nix
    ./hyprland.nix
    ./gtk.nix
    ./waybar.nix
    ./rofi.nix
    ./dunst.nix
    ./helix.nix
    ./fish.nix
  ];

  # Screen sharing
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-hyprland];
  };

  # Pipewire things
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };


  # User packackges in home directory
  home-manager.users.beaver = { pkgs, ... }: {
    home.packages = with pkgs; [ 
      dunst
      libnotify
      swww
      kitty
      firefox
      palemoon-bin
      obsidian
      insomnia
      telegram-desktop
      discord
      pyright
      libreoffice
      black
      ruff-lsp
      slurp
      grim
      wl-clipboard
      vesktop
      insomnia
    ];
    
    nixpkgs.config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "discord"
        "obsidian"
    ];

    nixpkgs.config.permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  home.stateVersion = "24.05"; 
  };
}
