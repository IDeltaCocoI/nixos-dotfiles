{ config, pkgs, ... }:

{
  # Assure-toi d'avoir installé le bon paquet Picom (ton fork)
  # Si ton fork n'est pas dans nixpkgs, tu gères l'installation via un overlay ou flake,
  # mais on demande au moins à Home Manager de générer le fichier de config :
  
  xdg.configFile."picom/picom.conf".text = ''
    # Shadows
    shadow = true;
    shadow-radius = 7;
    shadow-offset-x = -7;
    shadow-offset-y = -7;
    shadow-color = "#000000"

    # Fading
    fading = true;
    fade-in-step = 0.03;
    fade-out-step = 0.03;
    fade-delta = 5
    no-fading-openclose = false
    no-fading-destroyed-argb = false

    # Transparency
    frame-opacity = 1.0;

    # Corners
    corner-radius = 10

    # General Settings
    backend = "glx"
    dithered-present = false;
    vsync = true;
    detect-rounded-corners = true;
    detect-client-opacity = true;
    detect-transient = true;
    use-damage = true;

    # Blur
    blur:
    {
      method = "dual_kawase";
      strength = 4;
    }

    # Rules
    rules: (
      {
        blur-background = false;
        fade = false;
      },
      {
        match = "window_type = 'normal'";
        fade = true;
        shadow = true;
      },
      {
        match = "window_type = 'dialog'";
        shadow = true;
      },
      {
        match = "window_type = 'tooltip'";
        corner-radius = 0;
        opacity = 0.90;
      },
      {
        match = "fullscreen";
        corner-radius = 0;
      },
      {
        match = "window_type = 'dock'";
        corner-radius = 0;
        fade = true;
      },
      {
        match = "window_type = 'dropdown_menu' || window_type = 'menu' || window_type = 'popup' || window_type = 'popup_menu'";
        corner-radius = 0;
      },
      {
        match = "window_type = 'menu' || role = 'popup' || role = 'bubble'";
        shadow = false;
      },
      {
        match = "class_g = 'Alacritty' || class_g = 'st-256color' || class_g = 'kitty' || class_g = 'FloaTerm'";
        opacity = 1.0;
        blur-background = true;
      },
      {
        match = "class_g = 'bspwm-scratch' || class_g = 'Updating'";
        opacity = 0.93;
        blur-background = false;
      },
      {
        match = "class_g = 'Polybar' || class_g = 'eww-bar' || class_g = 'Viewnior' || class_g = 'Rofi' || class_g = 'mpv' || class_g = 'bspwm-scratch' || class_g = 'Dunst' || class_g = 'retroarch'";
        corner-radius = 0;
      },
      {
        match = "name = 'Notification' || class_g ?= 'Notify-osd' || class_g = 'Dunst' || class_g = 'Polybar' || class_g = 'Eww' || class_g = 'jgmenu' || class_g = 'bspwm-scratch' || class_g = 'Spotify' || class_g = 'retroarch' || class_g = 'firefox' || class_g = 'Rofi' || class_g = 'Screenkey' || class_g = 'mpv' || class_g = 'Viewnior' || _GTK_FRAME_EXTENTS@";
        shadow = false;
      },

      # ==========================================
      # ANIMATIONS (Anciennement @include)
      # ==========================================
      {
        match = "window_type = 'normal'";
        animations = (
          {
            triggers = ["close"];
            opacity = {
              curve = "cubic-bezier(0,1,1,1)";
              duration = 0.3;
              start = "window-raw-opacity-before";
              end = 0;
            };
            blur-opacity = "opacity";
            shadow-opacity = "opacity";
            scale-x = {
              curve = "cubic-bezier(0,1.3,1,1)";
              duration = 0.3;
              start = 1;
              end = 0.6;
            };
            scale-y = "scale-x";
            offset-x = "(1 - scale-x) / 2 * window-width";
            offset-y = "(1 - scale-y) / 2 * window-height";
            shadow-scale-x = "scale-x";
            shadow-scale-y = "scale-y";
            shadow-offset-x = "offset-x";
            shadow-offset-y = "offset-y";
          },
          {
            triggers = ["open"];
            opacity = {
              curve = "cubic-bezier(0,1,1,1)";
              duration = 0.5;
              start = 0;
              end = "window-raw-opacity";
            };
            blur-opacity = "opacity";
            shadow-opacity = "opacity";
            scale-x = {
              curve = "cubic-bezier(0,1,1,1)";
              duration = 0.5;
              start = 0.6;
              end = 1;
            };
            scale-y = "scale-x";
            offset-x = "(1 - scale-x) / 2 * window-width";
            offset-y = "(1 - scale-y) / 2 * window-height";
            shadow-scale-x = "scale-x";
            shadow-scale-y = "scale-y";
            shadow-offset-x = "offset-x";
            shadow-offset-y = "offset-y";
          },
          {
            triggers = ["geometry"];
            scale-x = {
              curve = "cubic-bezier(0,0,0,1.28)";
              duration = 0.5;
              start = "window-width-before / window-width";
              end = 1;
            };
            scale-x-reverse = {
              curve = "cubic-bezier(0,0,0,1.28)";
              duration = 0.3;
              start = "window-width / window-width-before";
              end = 1;
            };
            scale-y = {
              curve = "cubic-bezier(0,0,0,1.28)";
              duration = 0.5;
              start = "window-height-before / window-height";
              end = 1;
            };
            scale-y-reverse = {
              curve = "cubic-bezier(0,0,0,1.28)";
              duration = 0.3;
              start = "window-height / window-height-before";
              end = 1;
            };
            offset-x = {
              curve = "cubic-bezier(0,0,0,1.28)";
              duration = 0.5;
              start = "window-x-before - window-x";
              end = 0;
            };
            offset-y = {
              curve = "cubic-bezier(0,0,0,1.28)";
              duration = 0.5;
              start = "window-y-before - window-y";
              end = 0;
            };
            shadow-scale-x = "scale-x";
            shadow-scale-y = "scale-y";
            shadow-offset-x = "offset-x";
            shadow-offset-y = "offset-y";
          }
        )
      },
      {
        match = "class_g = 'Rofi'";
        animations = (
          { triggers = ["close", "hide"]; preset = "disappear"; duration = 0.05; scale = 0.5; },
          { triggers = ["open", "show"]; preset = "appear"; duration = 0.2; scale = 0.5; }
        )
      },
      {
        match = "class_g = 'Dunst'";
        animations = (
          { triggers = ["close", "hide"]; preset = "fly-out"; direction = "up"; duration = 0.2; },
          { triggers = ["open", "show"]; preset = "fly-in"; direction = "up"; duration = 0.2; }
        )
      },
      {
        match = "class_g = 'jgmenu'";
        animations = (
          { triggers = ["close", "hide"]; preset = "disappear"; duration = 0.08; scale = 0.5; },
          { triggers = ["open", "show"]; preset = "appear"; duration = 0.15; scale = 0.5; }
        )
      },
      {
        match = "class_g = 'bspwm-scratch'";
        animations = (
          { triggers = ["close", "hide"]; preset = "fly-out"; direction = "up"; duration = 0.2; },
          { triggers = ["open", "show"]; preset = "fly-in"; direction = "up"; duration = 0.2; }
        )
      },
      {
        match = "name = 'Eww - launchermenu'";
        animations = (
          { triggers = ["close", "hide"]; preset = "slide-out"; direction = "right"; duration = 0.2; },
          { triggers = ["open", "show"]; preset = "slide-in"; direction = "right"; duration = 0.2; }
        )
      },
      {
        match = "name = 'Eww - music'";
        animations = (
          { triggers = ["close", "hide"]; preset = "slide-out"; direction = "up"; duration = 0.2; },
          { triggers = ["open", "show"]; preset = "slide-in"; direction = "up"; duration = 0.2; }
        )
      },
      {
        match = "name = 'Eww - date'";
        animations = (
          { triggers = ["close", "hide"]; preset = "fly-out"; direction = "up"; duration = 0.2; },
          { triggers = ["open", "show"]; preset = "fly-in"; direction = "up"; duration = 0.2; }
        )
      },
      {
        match = "name = 'Eww - csheet'";
        animations = (
          { triggers = ["close", "hide"]; preset = "disappear"; duration = 0.08; scale = 0.5; },
          { triggers = ["open", "show"]; preset = "appear"; duration = 0.15; scale = 0.5; }
        )
      }
    )
  '';
}
