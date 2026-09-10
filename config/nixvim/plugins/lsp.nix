{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;

      servers = {
        # --- C/C++ ---
        clangd.enable = true;

        # --- Python ---
        pylsp.enable = true;

        # --- Bash ---
        bashls.enable = true;

        # --- Nix ---
        nil_ls.enable = true;

        # --- Lua ---
        lua_ls = {
          enable = true;
          settings.Lua = {
            runtime.version = "LuaJIT";
            diagnostics.globals = [ "vim" ];
            telemetry.enable = false;
            workspace = {
              checkThirdParty = false;
              library = [ { __raw = "vim.api.nvim_get_runtime_file('', true)"; } ];
            };
          };
        };
      };
    };

    diagnostic.settings = {
      virtual_text = true;
      signs = true;
      underline = true;
      update_in_insert = false;
      severity_sort = true;
      float = {
        border = "rounded";
      };
    };
  };
}
