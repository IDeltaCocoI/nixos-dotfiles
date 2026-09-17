{ colors, ... }:

{
  "module/s" = {
    type = "custom/text";
    content = "  ";
    content-foreground = colors.transparent;
    content-background = colors.transparent;
  };

  "module/left" = {
    type = "custom/text";
    content = "";
    content-foreground = colors.black;
    content-background = colors.transparent;
  };

  "module/right-black" = {
    type = "custom/text";
    content = "";
    content-foreground = colors.black;
    content-background = colors.transparent;
  };

  "module/right-gray" = {
    type = "custom/text";
    content = "";
    content-foreground = colors.disabled;
    content-background = colors.transparent;
  };

  "module/rofi" = {
    type = "custom/text";
    format = "󰋜";
    content-padding = 0;
    click-left = "exec rofi -show drun -disable-history -show-icons";
    click-right = "exec kitty -e nmtui";
    format-foreground = colors.cream;
    format-background = colors.black;
  };

  "module/i3" = {
    type = "internal/i3";
    enable-scroll = false;
    show-urgent = true;
    strip-wsnumbers = true;
    index-sort = true;
    enable-click = true;
    fuzzy-match = true;

    ws-icon-0 = "1;󰈹";
    ws-icon-1 = "2;";
    ws-icon-2 = "3;";
    ws-icon-3 = "4;";
    ws-icon-4 = "5;";
    ws-icon-5 = "6;󰭛";
    ws-icon-6 = "7;󱓷";
    ws-icon-7 = "8;󰚀";

    format = "<label-state> <label-mode>";
    label-mode = "%mode%";
    label-mode-padding = 0;
    label-mode-background = colors.red-alt;
    label-mode-foreground = colors.white;

    label-focused = "%icon%";
    label-focused-foreground = colors.yellow;
    label-focused-background = colors.black;
    label-focused-padding = 0;

    label-unfocused = "%icon%";
    label-unfocused-foreground = colors.cream;
    label-unfocused-background = colors.black;
    label-unfocused-padding = 0;

    label-urgent = "%icon%";
    label-urgent-foreground = colors.red-alt;
    label-urgent-background = colors.black;
    label-urgent-padding = 0;
  };

  "module/xwindow" = {
    type = "internal/xwindow";
    format-prefix = "    ";
    format-prefix-foreground = colors.yellow-mat;
    format-prefix-background = colors.black;
    label = "%class%";
    label-maxlen = 60;
    label-foreground = colors.cream;
    label-background = colors.disabled;
    label-padding-left = 2;
  };

  "module/time" = {
    type = "internal/date";
    interval = 5;
    format-prefix = "    ";
    format-prefix-foreground = colors.blue;
    format-prefix-background = colors.black;
    date = "%A  %d %b %Y  |  %H:%M:%S";
    label = "%date%";
    label-foreground = colors.cream;
    label-background = colors.disabled;
    label-padding-left = 2;
  };

  "module/filesystem" = {
    type = "internal/fs";
    interval = 10;
    mount-0 = "/";
    format-mounted-prefix = "    ";
    format-mounted-prefix-foreground = colors.orange;
    format-mounted-prefix-background = colors.black;
    label-mounted = "%free%";
    label-mounted-foreground = colors.cream;
    label-mounted-background = colors.disabled;
    label-mounted-padding-left = 2;
  };

  "module/cpu" = {
    type = "internal/cpu";
    interval = 2;
    format-prefix = "    ";
    format-prefix-foreground = colors.red;
    format-prefix-background = colors.black;
    label = "%percentage%%";
    label-foreground = colors.cream;
    label-background = colors.disabled;
    label-padding-left = 2;
  };

  "module/memory" = {
    type = "internal/memory";
    interval = 2;
    format-prefix = "    ";
    format-prefix-foreground = colors.aqua;
    format-prefix-background = colors.black;
    label = "%percentage_used%%";
    label-foreground = colors.cream;
    label-background = colors.disabled;
    label-padding-left = 2;
  };

  "module/pulseaudio" = {
    type = "internal/pulseaudio";
    format-volume-prefix = "    ";
    format-volume-prefix-foreground = colors.blue-alt;
    format-volume-prefix-background = colors.black;
    format-volume = "<label-volume>";
    label-volume = "%percentage%%";
    label-volume-foreground = colors.cream;
    label-volume-background = colors.disabled;
    label-volume-padding-left = 2;

    format-muted-prefix = " ●   ";
    format-muted-foreground = colors.blue-alt;
    format-muted-background = colors.black;
    label-muted = "%percentage%%";
    label-muted-foreground = colors.cream;
    label-muted-background = colors.disabled;
    label-muted-padding-left = 2;
  };

  "module/tray" = {
    type = "internal/tray";
    format = "<tray>";
    format-prefix = "󱊖   ";
    format-prefix-foreground = colors.orange;
    format-prefix-background = colors.black;
    tray-spacing = "14px";
    format-padding = "3px";
    format-background = colors.black;
    tray-background = colors.black;
  };

  "module/battery" = {
    type = "internal/battery";
    full-at = 99;
    low-at = 10;
    battery = "BAT1";
    adapter = "ADP1";
    poll-interval = 5;
    time-format = "%H:%M";

    format-charging = "<animation-charging><label-charging>";
    format-charging-foreground = colors.green;
    format-charging-background = colors.black;
    label-charging = "%percentage%%";
    label-charging-foreground = colors.cream;
    label-charging-background = colors.disabled;

    format-discharging = "<ramp-capacity><label-discharging>";
    format-discharging-foreground = colors.green;
    format-discharging-background = colors.black;
    label-discharging = "%percentage%%";
    label-discharging-foreground = colors.cream;
    label-discharging-background = colors.disabled;

    ramp-capacity-0 = "     ";
    ramp-capacity-1 = "     ";
    ramp-capacity-2 = "     ";
    ramp-capacity-3 = "     ";
    ramp-capacity-4 = "     ";

    ramp-capacity-0-foreground = colors.red-alt;
    ramp-capacity-1-foreground = colors.green-alt;
    ramp-capacity-2-foreground = colors.green-alt;
    ramp-capacity-3-foreground = colors.green-alt;
    ramp-capacity-4-foreground = colors.green-alt;

    animation-charging-0 = "     ";
    animation-charging-1 = "     ";
    animation-charging-2 = "     ";
    animation-charging-3 = "     ";
    animation-charging-4 = "     ";
    animation-charging-framerate = 500;
  };

  "module/backlight" = {
    type = "internal/backlight";
    card = "intel_backlight";
    use-actual-brightness = true;
    enable-scroll = true;
    format = "<label>";
    format-prefix = "    ";
    format-prefix-foreground = colors.yellow;
    format-prefix-background = colors.black;
    label = "%percentage%%";
    label-foreground = colors.cream;
    label-background = colors.disabled;
    label-padding-left = 2;
  };

  "module/spotify-left" = {
    type = "custom/script";
    exec = "~/.config/polybar/scripts/spotify-visible.sh ''";
    interval = 3; 
    format-foreground = colors.black;
    format-background = colors.transparent;
  };

  "module/spotify-right" = {
    type = "custom/script";
    exec = "~/.config/polybar/scripts/spotify-visible.sh ''";
    interval = 3;
    format-foreground = colors.black;
    format-background = colors.transparent;
  };

  "module/spotify" = {
    type = "custom/script";
    exec = "~/.config/polybar/scripts/spotify-visible.sh '󰓇 '";
    interval = 3;
    format-foreground = colors.green-spotify;
    format-background = colors.black;
    click-left = "exec i3-msg '[class=\"Spotify\"] focus' &>/dev/null";
  };

  "module/spotify-prev" = {
    type = "custom/script";
    exec = "~/.config/polybar/scripts/spotify-visible.sh ' '";
    interval = 3;
    format-foreground = colors.green-spotify;
    format-background = colors.black;
    click-left = "playerctl -p spotify previous";
  };

  "module/spotify-play-pause" = {
    type = "custom/script";
    exec = "~/.config/polybar/scripts/spotify-play-pause.sh";
    interval = 3;
    format-foreground = colors.green-spotify;
    format-background = colors.black;
    click-left = "playerctl -p spotify play-pause";
  };

  "module/spotify-next" = {
    type = "custom/script";
    exec = "~/.config/polybar/scripts/spotify-visible.sh ''";
    interval = 3;
    format-foreground = colors.green-spotify;
    format-background = colors.black;
    click-left = "playerctl -p spotify next";
  };
}
