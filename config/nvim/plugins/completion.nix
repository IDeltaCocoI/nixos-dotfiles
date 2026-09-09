{
  programs.nixvim = {
    # On injecte la logique complexe d'autopairs et ton état de menu ici
    extraConfigLua = ''
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      
      _G.cmp_in_menu = false
      
      cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
      )
    '';

    plugins.cmp = {
      enable = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];

        window = {
          completion = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:PmenuSel,Search:None";
          };
          documentation = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:PmenuSel,Search:None";
          };
        };

        mapping = {
          "<Tab>" = {
            __raw = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  _G.cmp_in_menu = true
                  cmp.select_next_item()
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
          };
          "<S-Tab>" = {
            __raw = ''
              cmp.mapping(function()
                if cmp.visible() then
                  _G.cmp_in_menu = true
                  cmp.select_prev_item()
                else
                  cmp.complete()
                end
              end, { "i", "s" })
            '';
          };
          "<Space>" = {
            __raw = ''
              cmp.mapping(function(fallback)
                if _G.cmp_in_menu then
                  cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert })
                  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(" ", true, false, true), "n", false)
                  _G.cmp_in_menu = false
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
          };
          "<CR>" = {
            __raw = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.confirm({ select = true })
                  _G.cmp_in_menu = false
                else
                  fallback()
                end
              end, { "i", "s" })
            '';
          };
          "<Esc>" = {
            __raw = ''
              cmp.mapping(function(fallback)
                cmp.abort()
                _G.cmp_in_menu = false
                fallback()
              end, { "i", "s" })
            '';
          };
        };
      };
    };
  };
}
