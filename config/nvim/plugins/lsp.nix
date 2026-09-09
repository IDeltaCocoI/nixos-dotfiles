{
  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      
      servers = {
        # --- C/C++ ---
        clangd = {
          enable = true;
          cmd = [
            "clangd"
            "--background-index=0"
            "--clang-tidy=0"
            "--header-insertion=never"
            "-j=1"
          ];
        };

        # --- Configurations simples ---
        pylsp.enable = true;
        jdtls.enable = true;
        sqls.enable = true;
        bashls.enable = true;
        rust_analyzer.enable = true;
        nil_ls.enable = true; # Remplace nixd (recommandé sous Nix)
        ocamllsp.enable = true;

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

    # Configuration de l'affichage des diagnostics
    diagnostics = {
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
