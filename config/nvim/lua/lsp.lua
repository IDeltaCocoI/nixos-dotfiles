-- lsp
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

-- C/C++
lspconfig.clangd.setup({})

-- Python
lspconfig.pylsp.setup({})

-- Java
lspconfig.jdtls.setup({})

-- SQL
lspconfig.sqls.setup({})

-- Bash
lspconfig.bashls.setup({})

-- Rust
lspconfig.rust_analyzer.setup({})

-- Nix
lspconfig.nixd.setup({})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
  },
})

