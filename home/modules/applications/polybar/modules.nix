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
    label-focused-font = 0;
    label-focused-foreground = colors.yellow;
    label-focused-background = colors.black;
    label-focused-padding = 0;

    label-unfocused = "%icon%";
    label-unfocused-font = 0;
    label-unfocused-foreground = colors.cream;
    label-unfocused-background = colors.black;
    label-unfocused-padding = 0;

    label-visible = %icon%;
    label-visible-padding = 0;

    label-urgent = "%icon%";
    label-urgent-font = 0;
    label-urgent-foreground = colors.red-alt;
    label-urgent-background = colors.black;
    label-urgent-padding = 0;

    label-separator = " ";
    label-separator-padding = 1;
    label-separator-foreground = colors.transparent;
    label-separator-background = colors.black;
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
    label-padding-right = 0;
  };

  "module/time" = {
    type = "internal/date";
    interval = 1;
    format-prefix = "    ";
    format-prefix-foreground = colors.blue;
    format-prefix-background = colors.black;
    date = "%A  %d %b %Y  |  %H:%M:%S";
    label = "%date%";
    label-foreground = colors.cream;
    label-background = colors.disabled;
    label-padding-left = 2;
    label-padding-right = 0;
  };

  "module/filesystem" = {
    type = "internal/fs";
    interval = 10;
    mount-0 = "/";
    format-mounted-prefix = "    ";
    format-mounted-prefix-foreground = colors.orange;
    format-mounted-prefix-background = colors.black;
    label-mounted = "%free%";
    label-unmounted =  %mountpoint% not mounted;
    label-mounted-foreground = colors.cream;
    label-mounted-background = colors.disabled;
    label-mounted-padding-left = 2;
    label-mounted-padding-right = 0;
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
    label-padding-right = 0;
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
    label-padding-right = 0;
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
    label-volume-padding-right = 0;

    format-muted-prefix = " ●   ";
    format-muted-foreground = colors.blue-alt;
    format-muted-background = colors.black;
    label-muted = "%percentage%%";
    label-muted-foreground = colors.cream;
    label-muted-background = colors.disabled;
    label-muted-padding-left = 2;
    label-muted-padding-right = 0;
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
    low-at = 20;
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
    label-charging-padding-left = 3;
    label-charging-padding-rigt = 1;

    format-discharging = "<ramp-capacity><label-discharging>";
    format-discharging-foreground = colors.green;
    format-discharging-background = colors.black;
    label-discharging = "%percentage%%";
    label-discharging-foreground = colors.cream;
    label-discharging-background = colors.disabled;
    label-discharging-padding-left = 3;
    label-discharging-padding-right = 1;

    format-full = "<ramp-capacity><label-full>";
    label-full = %percentage%%
    label-full-foreground = colors.cream;
    label-full-background = colors.disabled;
    label-full-padding-left = 3;
    label-full-padding-right = 1;
  
    format-low = "<ramp-capacity><label-low>"
    label-low = %percentage%%
    label-low-foreground = colors.cream;
    label-low-background = colors.disabled;
    label-low-padding-left = 3
    label-low-padding-right = 1

    ramp-capacity-0 = "     ";
    ramp-capacity-1 = "     ";
    ramp-capacity-2 = "     ";
    ramp-capacity-3 = "     ";
    ramp-capacity-4 = "     ";

    ramp-capacity-0-padding-left = 1;
    ramp-capacity-0-padding-right = 3;
    
    ramp-capacity-1-padding-left = 1;
    ramp-capacity-1-padding-right = 3;
    
    ramp-capacity-2-padding-left = 1;
    ramp-capacity-2-padding-right = 3;
    
    ramp-capacity-3-padding-left = 1;
    ramp-capacity-3-padding-right = 3;
    
    ramp-capacity-4-padding-left = 1;
    ramp-capacity-4-padding-right = 3;

    ramp-capacity-0-foreground = colors.red-alt;
    ramp-capacity-1-foreground = colors.green-alt;
    ramp-capacity-2-foreground = colors.green-alt;
    ramp-capacity-3-foreground = colors.green-alt;
    ramp-capacity-4-foreground = colors.green-alt;

    ramp-capacity-0-background = colors.black;
    ramp-capacity-1-background = colors.black;
    ramp-capacity-2-background = colors.black;
    ramp-capacity-3-background = colors.black;
    ramp-capacity-4-background = colors.black;
    
    bar-capacity-width = 0

    animation-charging-0 = "     ";
    animation-charging-1 = "     ";
    animation-charging-2 = "     ";
    animation-charging-3 = "     ";
    animation-charging-4 = "     ";
    animation-charging-framerate = 500;

    animation-charging-0-padding-left = 1
    animation-charging-0-padding-right = 3
    
    animation-charging-1-padding-left = 1
    animation-charging-1-padding-right = 3
    
    animation-charging-2-padding-left = 1
    animation-charging-2-padding-right = 3
    
    animation-charging-3-padding-left = 1
    animation-charging-3-padding-right = 3
    
    animation-charging-4-padding-left = 1
    animation-charging-4-padding-right = 3

    animation-charging-0-foreground = colors.green;
    animation-charging-1-foreground = colors.green;
    animation-charging-2-foreground = colors.green;
    animation-charging-3-foreground = colors.green;
    animation-charging-4-foreground = colors.green;
    
    animation-charging-0-background = colors.black;
    animation-charging-1-background = colors.black;
    animation-charging-2-background = colors.black;
    animation-charging-3-background = colors.black;
    animation-charging-4-background = colors.black;
    
    animation-discharging-0 =[  ];
    animation-discharging-1 =[  ];
    animation-discharging-2 =[  ];
    animation-discharging-3 =[  ];
    animation-discharging-4 =[  ];
    animation-discharging-framerate = 500;
    
    animation-discharging-0-padding-left = 1;
    animation-discharging-0-padding-right = 3;
    
    animation-discharging-1-padding-left = 1;
    animation-discharging-1-padding-right = 3;
    
    animation-discharging-2-padding-left = 1;
    animation-discharging-2-padding-right = 3;
    
    animation-discharging-3-padding-left = 1;
    animation-discharging-3-padding-right = 3;
    
    animation-discharging-4-padding-left = 1;
    animation-discharging-4-padding-right = 3;
    
    animation-discharging-0-foreground = colors.cream;
    animation-discharging-1-foreground = colors.cream;
    animation-discharging-2-foreground = colors.cream;
    animation-discharging-3-foreground = colors.cream;
    animation-discharging-4-foreground = colors.cream;
    
    animation-discharging-0-background = colors.green-alt;
    animation-discharging-1-background = colors.green-alt;
    animation-discharging-2-background = colors.green-alt;
    animation-discharging-3-background = colors.green-alt;
    animation-discharging-4-background = colors.green-alt;
    
    animation-low-0 = !;
    animation-low-1 = !!;
    animation-low-framerate = 200;
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
    format-padding-left = 2;
    format-padding-right = 0;
    label = "%percentage%%";
    label-foreground = colors.cream;
    label-background = colors.disabled;
    label-padding-left = 2;
    label-padding-right = 0;
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
