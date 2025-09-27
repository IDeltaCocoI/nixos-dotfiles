vim.o.number = true

vim.o.cursorline = true

vim.cmd('filetype on')

vim.cmd('syntax on')
vim.opt.termguicolors = true
vim.diagnostic.config({ virtual_text = false, virtual_lines = { current_line = true }, })
vim.cmd.colorscheme("rose-pine-dawn")

vim.o.autoindent = true


vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.softtabstop = 2
