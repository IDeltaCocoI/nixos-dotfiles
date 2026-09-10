{
  programs.nixvim = {
    plugins.web-devicons.enable = true;

    plugins.neo-tree = {
      enable = true;
      closeIfLastWindow = true;
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
