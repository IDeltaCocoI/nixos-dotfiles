-- keymaps

-- Neo-tree
vim.keymap.set("n", "<Tab>", function()
  vim.cmd("Neotree toggle left")
end, { silent = true, noremap = true })

-- 
