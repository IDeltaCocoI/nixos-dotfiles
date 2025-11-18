{ config, lib, pkgs, ... }:
{
    imports = [ 
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

    users.users.corentin = {
        isNormalUser = true;
        extraGroups = [ "wheel" "docker" ];
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
        protonvpn-gui
        lua-language-server
        btop
        brightnessctl
        vencord
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
        ripgrep
        fd
        nodejs
        valgrind
        clang-tools
        llvm
        gnumake
        gcc
        gcovr
        gdb
        networkmanagerapplet
    ];

    fonts.packages = with pkgs; [
        nerd-fonts.jetbrains-mono
    ];

    networking.firewall.allowedTCPPorts = [ ];

    hardware.enableAllFirmware = true;
    boot.extraModulePackages = [
        pkgs.linuxPackages.rtl8812au
    ];

    virtualisation.docker.enable = true;

    security.wrappers.ubridge = {
        source = "${pkgs.ubridge}/bin/ubridge";
        capabilities = "cap_net_admin,cap_net_raw+ep";
        owner = "root";
        group = "root";
        permissions = "0755";
    };


    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    system.stateVersion = "25.05";
}

