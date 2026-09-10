{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options = {
        # -- Separators --
        component_separators = { left = "  "; right = "  "; };
        section_separators = { left = ""; right = ""; };
        # -- Single status bar --
        globalstatus = true;
      };

      # -- Bottom bar --
      sections = {
        # -- Left side --
        lualine_a = [ "mode" ];
        lualine_b = [ "filename" ];
        lualine_c = [ "branch" "diff" ];

        # -- Right side --
        lualine_x = [ "filetype" ];
        lualine_y = [ "progres" ];
        lualine_z = [ "location" ];
      };

      # -- Top bar --
      tabline = {
        lualine_a = [ "buffers" ];
      };
    };
  };
}
