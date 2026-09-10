{
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;
      settings.options = {
        numbers = "ordinal";
        diagnostics = "nvim_lsp";
        separator_style = "thin";
        always_show_bufferline = true;
      };
    };

    keymaps = [
      # -- Next buffer --
      {
        mode = "n";
        key = "<Tab>";
        action = "<cmd>BufferLineCycleNext<CR>";
        options.desc = "Next buffer";
      }
      # -- Previous buffer --
      {
        mode = "n";
        key = "<S-Tab>";
        action = "<cmd>BufferLineCyclePrev<CR>";
        options.desc = "Previous buffer";
      }

      # -- Jump to buffer 1 --
      {
        mode = "n";
        key = "<A-1>";
        action = "<cmd>BufferLineGoToBuffer 1<CR>";
        options.desc = "Go to buffer 1";
      }
      # -- Jump to buffer 2 --
      {
        mode = "n";
        key = "<A-2>";
        action = "<cmd>BufferLineGoToBuffer 2<CR>";
        options.desc = "Go to buffer 2";
      }
      # -- Jump to buffer 3 --
      {
        mode = "n";
        key = "<A-3>";
        action = "<cmd>BufferLineGoToBuffer 3<CR>";
        options.desc = "Go to buffer 3";
      }
      # -- Jump to buffer 4 --
      {
        mode = "n";
        key = "<A-4>";
        action = "<cmd>BufferLineGoToBuffer 4<CR>";
        options.desc = "Go to buffer 4";
      }
      # -- Jump to buffer 5 --
      {
        mode = "n";
        key = "<A-5>";
        action = "<cmd>BufferLineGoToBuffer 5<CR>";
        options.desc = "Go to buffer 5";
      }
      # -- Jump to buffer 6 --
      {
        mode = "n";
        key = "<A-6>";
        action = "<cmd>BufferLineGoToBuffer 6<CR>";
        options.desc = "Go to buffer 6";
      }
      # -- Jump to buffer 7 --
      {
        mode = "n";
        key = "<A-7>";
        action = "<cmd>BufferLineGoToBuffer 7<CR>";
        options.desc = "Go to buffer 7";
      }
      # -- Jump to buffer 8 --
      {
        mode = "n";
        key = "<A-8>";
        action = "<cmd>BufferLineGoToBuffer 8<CR>";
        options.desc = "Go to buffer 8";
      }
      # -- Jump to buffer 9 --
      {
        mode = "n";
        key = "<A-9>";
        action = "<cmd>BufferLineGoToBuffer 9<CR>";
        options.desc = "Go to buffer 9";
      }
    ];
  };
}
