-- ==============================
-- Basic Options
-- ==============================
vim.o.number = true           -- show line numbers
vim.o.relativenumber = true   -- show relative line numbers
vim.o.expandtab = true        -- convert tabs to spaces
vim.o.shiftwidth = 2          -- spaces per indent
vim.o.tabstop = 2             -- spaces per tab
vim.o.smartindent = true      -- smart auto-indentation

-- ==============================
-- Plugin Manager (lazy.nvim)
-- ==============================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "nvim-treesitter/nvim-treesitter", -- Treesitter for syntax
  "neovim/nvim-lspconfig",           -- Legacy LSP config (optional in 0.11)
  "hrsh7th/nvim-cmp",                -- Completion engine
  "hrsh7th/cmp-nvim-lsp",            -- LSP source for nvim-cmp
  "nvim-lua/plenary.nvim",           -- Lua utils (needed by telescope)
  "nvim-telescope/telescope.nvim"    -- Telescope fuzzy finder
}, {
  rocks = { hererocks = false, enabled = false }
})

-- ==============================
-- LSP Keymaps
-- ==============================
local opts = { noremap=true, silent=true }
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format { async = true }
end, opts)

-- ==============================
-- LSP Servers
-- ==============================
-- C / C++
vim.lsp.config.clangd = { cmd = { "clangd" } }
vim.lsp.enable("clangd")

-- ==============================
-- Autocompletion (nvim-cmp)
-- ==============================
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- requires vsnip
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  })
})

