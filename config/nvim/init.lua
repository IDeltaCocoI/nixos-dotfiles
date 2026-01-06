local old_notify = vim.notify

vim.notify = function(msg, log_level, opts)
    if type(msg) == "string" and msg:match("The `require%(\'lspconfig\'%)`") then
        return
    end

    if type(opts) ~= "table" then
        opts = {}
    end

    old_notify(msg, log_level, opts)
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

-- Autopairs
require("autopairs")
