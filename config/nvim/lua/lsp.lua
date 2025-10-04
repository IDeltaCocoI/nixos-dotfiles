-- lua/lsp.lua
local lspconfig = require("lspconfig")

-- Clangd pour C/C++
lspconfig.clangd.setup({
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = lspconfig.util.root_pattern(".git", "compile_commands.json", "Makefile"),
})

-- Lua LSP pour config Neovim
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

