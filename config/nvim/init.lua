vim.notify = function(msg, log_level, opts)
  if msg:match("The `require%(\'lspconfig\'%)`") then
    return
  else
    vim.api.nvim_notify(msg, log_level, opts)
  end
end

-- init.lua
require("colors").setup()

-- Core settings
require("settings")

-- Keymaps
require("keymaps")

-- Plugins
require("plugins")

-- Treesitter
require("treesitter")

-- LSP
require("lsp")

-- Autocompletion
require("cmp_config")

