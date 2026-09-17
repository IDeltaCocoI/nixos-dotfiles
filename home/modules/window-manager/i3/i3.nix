{ config, lib, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = "Mod4";
      
      fonts = {
        names = [ "JetBrainsMono" ];
        size = 10.0;
      };

      terminal = "kitty";
      menu = "dmenu_run";

      window = {
        border = 0;
      };

      gaps = {
        inner = 10;
      };

      bar = [];

      floating.modifier = "Mod4";

      startup = [
        { command = "nm-applet"; always = false; notification = false; }
        { command = "~/.config/i3/polybar.sh"; always = false; notification = false; }
        { command = "picom -b"; always = false; notification = false; }
        { command = "~/nixos-dotfiles/wallpapers/wallpapers.sh"; always = false; notification = false; }
        { command = "xinput set-prop \"SynPS/2 Synaptics TouchPad\" \"libinput Natural Scrolling Enabled\" 1"; always = false; notification = false; }
        { command = "xinput set-prop \"SynPS/2 Synaptics TouchPad\" \"libinput Accel Speed\" 0.1"; always = false; notification = false; }
        { command = "xinput set-prop 10 \"libinput Natural Scrolling Enabled\" 1"; always = false; notification = false; }
        { command = "xinput set-prop 10 \"libinput Accel Speed\" 0.6"; always = false; notification = false; }
        { command = "dex --autostart --environment i3"; always = false; notification = false; }
      ];

      keybindings = lib.mkOptionDefault {
        "modifier+o" = "exec --no-startup-id ~/.config/i3/rotation.sh";
        "modifier+Shift+i" = "exec ~/.config/i3/i3lock.sh";
        "modifier+Shift+b" = "exec --no-startup-id firefox";
        "modifier+Shift+s" = "exec maim -s | xclip -selection clipboard -t image/png";
        "modifier+Return" = "exec kitty";
        "modifier+d" = "exec --no-startup-id ${config.xsession.windowManager.i3.config.menu}";

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
