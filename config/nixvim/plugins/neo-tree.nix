{
  programs.nixvim.plugins.web-devicons.enable = true;

  programs.nixvim.plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = false;
    
    # On utilise extraOptions au lieu de settings pour ce plugin
    extraOptions = {
      event_handlers = [
        {
          event = "file_opened";
          handler.__raw = ''
            function(_)
              require("neo-tree.command").execute({ action = "close" })
            end
          '';
        }
      ];
    };
  };
}
