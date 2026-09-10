{
  programs.nixvim = {
    plugins.flash.enable = true;

    keymaps = [
      # -- Search word --
      {
        mode = [ "n" "x" "o" ];
        key = "s";
        action = { __raw = "function() require('flash').jump() end"; };
        options.desc = "Flash Jump";
      }
      # -- Treesitter smart selection --
      {
        mode = [ "n" "x" "o" ];
        key = "S";
        action = { __raw = "function() require('flash').treesitter() end"; };
        options.desc = "Flash Treesitter";
      }
      # -- Remote action --
      {
        mode = "o";
        key = "r";
        action = { __raw = "function() require('flash').remote() end"; };
        options.desc = "Remote Flash";
      }
    ];
  };
}
