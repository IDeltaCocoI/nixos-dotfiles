-- keymaps

-- Neo-tree
vim.keymap.set("n", "<Tab>", function()
  vim.cmd("Neotree toggle left")
end, { silent = true, noremap = true })

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })


