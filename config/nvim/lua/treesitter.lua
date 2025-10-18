-- treesitter
local ok, ts = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

ts.setup({
  modules = {},
  sync_install = false,
  ignore_install = {},

  ensure_installed = {},
  auto_install = false,

  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
})

