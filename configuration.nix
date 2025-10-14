{ config, lib, pkgs, ... }:
{
    imports = [ ./hardware-configuration.nix ];

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

    users.users.corentin = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        packages = with pkgs; [
            tree
        ];
    };

    documentation.man.enable = true;
    documentation.dev.enable = true;

    programs.firefox.enable = true;

    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        wget
        alacritty
        btop
        feh
        man
        glibc.dev
        man-pages
        bash
        coreutils
        findutils
        diffutils
        util-linux
        gawk
        less
        procps
        shadow
        which
        file
        rofi
        pcmanfm
        spotify
        pulseaudio
        discord
        git
        criterion
        fastfetch
        clang
        clang-tools
        llvm
        gnumake
        gcovr
        gdb
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

