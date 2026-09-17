{ theme, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_night";

    font = theme.font;

    settings = {
      background_opacity = "0.7";

      # cursor_trail = "3";
      copy_on_select = "yes";

      detect_urls = "yes";
      url_style = "curly";
    };
  };
}
