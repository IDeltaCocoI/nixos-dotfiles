vim.notify = function(msg, log_level, opts)
  if msg:match("The `require%(\'lspconfig\'%)`") then
    return
  else
    vim.api.nvim_notify(msg, log_level, opts)
  end
end

-- Thème / couleurs
require("colorscheme").setup()

-- Core settings
require("settings")

-- Keymaps
require("keymaps")

-- Plugins
require("plugins")

-- Dashboard
require("dashboard_config")

-- Flash plugin
require("flash_config")

-- Lualine
require("lualine")

-- Neo-tree
require("neo-tree_config")

-- nvim-surround
require("nvim-surround")

-- Treesitter
require("treesitter")

-- LSP
require("lsp")

-- Autocompletion
require("completion")

-- Telescope
require("telescope")

-- Count Line for C language
require("countline")
