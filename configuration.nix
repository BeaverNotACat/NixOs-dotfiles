{ config, lib, pkgs, ... }:
{
  # Config modules
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./dotfiles
    ];

  # Systemd boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "BeaversLaptop"; # Define your hostname.
    # Pick only one of the below networking options.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.userControlled.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.settings = { 
    General = { 
      ControllerMode = "bredr";
      FastConnectable = true;
      # Class = "0x000100";
      JustWorksRepairing = true;
      };
    GATT = {
      ReconnectIntervals = 1;
      AutoEnable=true;
    };
  };
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  # Time zone
  time.timeZone = "Asia/Vladivostok";

  # Proxy
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # TTY internationalosation
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };


  # Default shell
  users.defaultUserShell = pkgs.fish;
  programs.fish.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    gcc
    libgcc
    gnumake
    fish
    tmux
    neovim
    helix
    python3
    poetry
    git
    zip
    unzip
  ];


  # Binaries sharing
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libgcc
  ];

  # Users
  users.users.beaver = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # Config reserve copy
  # (/run/current-system/configuration.nix)
  system.copySystemConfiguration = true;

  # Garbage collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  # SUID wrappers
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # OpenSSH daemon.
  # services.openssh.enable = true;

  # Firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Disable the firewall altogether.
  # networking.firewall.enable = false;

  # System version
  system.stateVersion = "24.05";
}

