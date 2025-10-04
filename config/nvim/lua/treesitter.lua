-- lua/treesitter.lua
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "lua" },
  highlight = { enable = true },
  indent = { enable = true }
}

