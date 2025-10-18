-- nvim-surround
local ok, surround = pcall(require, "nvim-surround")
if not ok then
  return
end

surround.setup({
  keymaps = {
    insert = nil,
    insert_line = nil,
    normal = "ya",
    normal_line = "yA",
    delete = "da",
    change = nil,
  },
})

