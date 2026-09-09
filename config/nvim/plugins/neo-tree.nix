{
  # Active les icônes (l'équivalent de ton require("nvim-web-devicons").setup({}))
  programs.nixvim.plugins.web-devicons.enable = true;

  programs.nixvim.plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = false;
    
    settings = {
      event_handlers = [
        {
          event = "file_opened";
          # __raw permet d'injecter du code Lua brut directement
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
