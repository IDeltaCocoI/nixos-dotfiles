{
  programs.nixvim.keymaps = [
    # -- Next buffer --
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>bnext<CR>";
      options.desc = "Next buffer";
    }

    # -- Previous buffer --
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>bprevious<CR>";
      options.desc = "Previous buffer";
    }

    # -- Close current buffer --
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<CR>";
      options.desc = "Delete buffer";
    }

    # -- Disable space in NORMAL mode --
    {
      mode = "n";
      key = "<Space>";
      action = "<Nop>";
      options.silent = true;
      options.desc = "Disable space movement";
    }
  ];
}
