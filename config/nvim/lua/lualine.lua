-- lualine
local ok, lualine = pcall(require, "lualine")
if not ok then
  return
end

lualine.setup({
  options = {
    component_separators = { left = " ", right = " " },
    section_separators = { left = " ", right = " " },
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "filename" },
    lualine_c = { "branch", "diff" },
    lualine_x = { "fileformat", "filetype" },
    lualine_z = { "location" },
  },
  tabline = {
    lualine_z = { "buffers" },
  },
})

