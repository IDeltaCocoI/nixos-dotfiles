{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "corentin-nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";

  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;   
    windowManager.i3.enable = true;
    displayManager.sessionCommands = ''
      xwallpaper --zoom ~/wallpapers/stormveil_castle.jpg
    '';
  };

  services.displayManager.ly.enable = true; 

  services.picom = {
    enable = true;
    backend = "glx";
    fade = true;
  };

  users.users.corentin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    neovim
    alacritty
    btop
    xwallpaper
    rofi
    pcmanfm
    spotify
    discord
    git
    neofetch
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";
}

