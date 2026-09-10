{
  programs.nixvim = {
    plugins.web-devicons.enable = true;

    plugins.neo-tree = {
      enable = true;
      closeIfLastWindow = true;

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

    keymaps = [
      # -- Open / Close --
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<CR>";
        options.desc = "Toggle Neo-tree";
      }
    ];
  };
}
