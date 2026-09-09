{
  programs.nixvim.keymaps = [
  # Neo-tree
  {
    mode = "n";
    key = "<Tab>";
    action = "<cmd>Neotree toggle left<CR>";
    options = {
      silent = true;
      desc = "Toggle Neo-tree";
    };
  }

  # Telescope
  {
    mode = "n";
    key = "<leader>ff";
    action = "<cmd>Telescope find_files<CR>";
    options = {
      silent = true;       
      desc = "Find files";
    };
  }
  {
    mode = "n";
    key = "<leader>fg";
    action = "<cmd>Telescope live_grep<CR>";
    options = {
      silent = true;
      desc = "Live grep";
    };
  }
  {
    mode = "n";
    key = "<leader>fb";
    action = "<cmd>Telescope buffers<CR>";
    options = {
      silent = true;
      desc = "Find buffers";
    };
  }
  ];
}
