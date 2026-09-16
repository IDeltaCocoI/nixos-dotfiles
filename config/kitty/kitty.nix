{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_night";

    font = {
      name = "0xProto Nerd Font"; 
      package = pkgs.nerd-fonts._0xproto; 
      size = 12.0;
    };

    settings = {
      background_opacity = "0.7";

      # cursor_trail = "3";
      copy_on_select = "yes";

      detect_urls = "yes";
      url_style = "curly";
    };
  };
}
