{ pkgs, ... }:

let
  colors = import ./color.nix;
  modules = import ./module.nix { inherit colors; };
in
  {
  services.polybar = {
    enable = true;

    package = pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
    };

    config = {
      "settings" = {
        screenchange-reload = true;
        pseudo-transparency = true;
      };

      "bar/ghost" = {
        width = "100%";
        height = "10pt";
        background = colors.transparent;
        foreground = colors.transparent;
        override-redirect = false;
        modules-left = "s";
      };

      "bar/i3_bar" = {
        width = "100%";
        height = "18pt";
        radius = 0;
        dpi = 100;
        background = colors.transparent;
        foreground = colors.cream;
        border-size = "0pt";
        border-color = colors.transparent;
        module-margin = 0;
        padding-left = "10pt";
        padding-right = "10pt";
        separator = "";
        separator-foreground = colors.transparent;

        font-0 = "Roboto condensed:size=10:weight=bold;2";
        font-1 = "JetBrainsMono Nerd Font Mono:size=18:weight=bold;5";
        font-2 = "Noto Sans Symbols2:size=14;2";

        modules-left = "left rofi right-black s left i3 right-black s left xwindow right-gray s left tray right-black s spotify-left spotify spotify-prev spotify-play-pause spotify-next spotify-right";
        modules-center = "left time right-gray";
        modules-right = "left cpu right-gray s left memory right-gray s left filesystem right-gray s left pulseaudio right-gray";

        cursor-click = "pointer";
        enable-ipc = true;
        wm-restack = "i3";
      };

      "bar/i3_bar_laptop" = {
        width = "100%";
        height = "28pt";
        radius = 0;
        dpi = 100;
        background = colors.transparent;
        foreground = colors.cream;
        border-size = "0pt";
        border-color = colors.transparent;
        module-margin = 0;
        padding-left = "10pt";
        padding-right = "10pt";
        separator = "";
        separator-foreground = colors.transparent;

        font-0 = "Roboto condensed:size=14:weight=bold;2";
        font-1 = "JetBrainsMono Nerd Font Mono:size=24:weight=bold;4";
        font-2 = "Noto Sans Symbols2:size=20;2";

        modules-left = "left rofi right-black s left i3 right-black s left xwindow right-gray s left tray right-black s spotify-left spotify spotify-prev spotify-play-pause spotify-next spotify-right";
        modules-center = "left time right-gray";
        modules-right = "left cpu right-gray s left memory right-gray s left filesystem right-gray s left backlight right-gray s left pulseaudio right-gray s left battery right-gray";

        cursor-click = "pointer";
        enable-ipc = true;
        wm-restack = "i3";
      };

      "bar/i3_bar_epita" = {
        width = "100%";
        height = "18pt";
        radius = 0;
        dpi = 100;
        background = colors.transparent;
        foreground = colors.cream;
        border-size = "0pt";
        border-color = colors.transparent;
        module-margin = 0;
        padding-left = "10pt";
        padding-right = "10pt";
        separator = "";
        separator-foreground = colors.transparent;

        font-0 = "Roboto condensed:size=10:weight=bold;2";
        font-1 = "JetBrainsMono Nerd Font Mono:size=18:weight=bold;5";
        font-2 = "Noto Sans Symbols2:size=14;2";

        modules-left = "left rofi right-black s left i3 right-black s left xwindow right-gray s spotify-left spotify spotify-prev spotify-play-pause spotify-next spotify-right";
        modules-center = "left time right-gray";
        modules-right = "left cpu right-gray s left memory right-gray s left filesystem right-gray s left pulseaudio right-gray";

        cursor-click = "pointer";
        enable-ipc = true;
        wm-restack = "i3";
      };
    } // modules;
  };
}
