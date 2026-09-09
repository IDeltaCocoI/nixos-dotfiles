{
  programs.nixvim.plugins.telescope = {
    enable = true;
    
    settings = {
      defaults = {
        mappings.i = {
          "<esc>" = { __raw = "require('telescope.actions').close"; };
        };
      };
    };

    extensions = {
      fzf-native = {
        enable = true;
        settings = {
          fuzzy = true;
          override_generic_sorter = true;
          override_file_sorter = true;
          case_mode = "smart_case";
        };
      };
      ui-select.enable = true;
    };
  };
}
