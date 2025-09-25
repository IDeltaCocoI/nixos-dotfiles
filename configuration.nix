{ config, lib, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Paris";

  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    windowManager.i3.enable = true;
  };

  services.displayManager.ly.enable = true;

  services.picom = {
    enable = true;
    backend = "glx";
    fade = true;
  };


  services.logind.extraConfig = ''
    IdleAction=ignore
    IdleActionSec=0
    HandleLidSwitch=ignore
    HandleLidSwitchDocked=ignore
    HandleSuspendKey=ignore
    HandleHibernateKey=ignore
  '';

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
    alacritty
    btop
    feh
    rofi
    pcmanfm
    spotify
    pulseaudio
    discord
    git
    neofetch 
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  hardware.enableAllFirmware = true;
  boot.extraModulePackages = [
    pkgs.linuxPackages.rtl8812au
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";
}

