{ pkgs, lib, theme, ... }:

let 
  mod = "Mod4";
  menu = "dmenu_run";

  scripts = import ./scripts { inherit pkgs; inherit theme; };
in
{
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = mod;
      
      fonts = {
        names = [ theme.font.name ];
        size = theme.font.size;
      };

      terminal = "kitty";
      menu = menu;

      window = {
        titlebar = false;
        border = 0;
      };

      gaps = {
        inner = 10;
      };

      bars = [];

      floating.modifier = mod;

      startup = [
        { command = "nm-applet"; always = false; notification = false; }
        { command = "${scripts.polybar}/bin/polybar"; always = false; notification = false; }
        { command = "picom -b"; always = false; notification = false; }
        { command = "feh --bg-scale ${theme.wallpaper}"; always = false; notification = false; }
        { command = "xinput set-prop \"SynPS/2 Synaptics TouchPad\" \"libinput Natural Scrolling Enabled\" 1"; always = false; notification = false; }
        { command = "xinput set-prop \"SynPS/2 Synaptics TouchPad\" \"libinput Accel Speed\" 0.1"; always = false; notification = false; }
        { command = "xinput set-prop 10 \"libinput Natural Scrolling Enabled\" 1"; always = false; notification = false; }
        { command = "xinput set-prop 10 \"libinput Accel Speed\" 0.6"; always = false; notification = false; }
        { command = "dex --autostart --environment i3"; always = false; notification = false; }
      ];

      keybindings = lib.mkOptionDefault {
        "${mod}+o" = "exec --no-startup-id ${scripts.rotation}/bin/rotation";
        "${mod}+Shift+i" = "exec ${scripts.lock}/bin/lock";
        "${mod}+Shift+b" = "exec --no-startup-id firefox";
        "${mod}+Shift+s" = "exec maim -s | xclip -selection clipboard -t image/png";
        "${mod}+Return" = "exec kitty";
        "${mod}+d" = "exec --no-startup-id ${menu}";

        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +1% && pkill -RTMIN+10 i3blocks";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -1% && pkill -RTMIN+10 i3blocks";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && pkill -RTMIN+10 i3blocks";
        "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && pkill -RTMIN+10 i3blocks";

        "XF86MonBrightnessDown" = "exec --no-startup-id brightnessctl set 10%-";
        "XF86MonBrightnessUp" = "exec --no-startup-id brightnessctl set +10%";
      };
    };
  };
}
