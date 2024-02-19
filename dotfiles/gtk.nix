{ config, lib, pkgs, ... }:
{
  home-manager.users.beaver = { pkgs, ...}: {
    gtk = {
      enable = true;
      theme = {
        name = "Catppuccin-Macchiato-Compact-Pink-Dark";
        package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "macchiato";
        };
      };
      iconTheme = {
        name = "cat-mocha-pink";
        package = pkgs.catppuccin-papirus-folders;
      };
    }; 
    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.catppuccin-cursors.mochaLight; 
      size = 32;
      name = "Catppuccin-Mocha-Light-Cursors";
    }; 
  };
}
