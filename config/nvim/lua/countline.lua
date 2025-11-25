local M = {}

local ts = vim.treesitter
local parser_configs = require'nvim-treesitter.parsers'.get_parser_configs()

if not parser_configs.c then
  error("C treesitter parser not installed. Install via nvim-treesitter.")
end

local ns = vim.api.nvim_create_namespace('c_func_lines')

M.threshold = 30

local function is_ignorable(line)
  local trimmed = line:match("^%s*(.-)%s*$")
  if trimmed == '' then return true end
  if trimmed == '{' or trimmed == '}' then return true end
  if trimmed:match('^//') then return true end
  if trimmed:match('^/[*]') then return true end
  return false
end

local function count_function_lines(bufnr, func_node)
  local start_row, _, end_row, _ = func_node:range()

  local declarator = nil
  for child in func_node:iter_children() do
    if child:type() == "function_declarator" then
      declarator = child
      break
    end
  end

  local declarator_end_row = start_row
  if declarator then
    local _, _, decl_end_row, _ = declarator:range()
    declarator_end_row = decl_end_row
  end

  local count = 0
  for row = declarator_end_row + 1, end_row do
    local line = vim.api.nvim_buf_get_lines(bufnr, row, row+1, false)[1] or ''
    if not is_ignorable(line) then
      count = count + 1
    end
  end

  return count, start_row
end

function M.count()
  local bufnr = vim.api.nvim_get_current_buf()
  local lang = 'c'

  local ok, parser = pcall(ts.get_parser, bufnr, lang)
  if not ok then return end

  local tree = parser:parse()[1]
  local root = tree:root()

  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

  local query = ts.query.parse(lang, [[
    (function_definition
      declarator: (function_declarator)
    ) @func
  ]])

  for _, node in query:iter_captures(root, bufnr, 0, -1) do
    local count, start_row = count_function_lines(bufnr, node)

    local color = (count > M.threshold) and "Error" or "Comment"

    vim.api.nvim_buf_set_extmark(bufnr, ns, start_row, 0, {
      virt_text = {{"-- " .. count .. " lines", color}},
      virt_text_pos = 'eol',
    })
  end
end

function M.enable_auto_update()
  vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI", "BufEnter"}, {
    pattern = {"*.c", "*.h"},
    callback = function()
      M.count()
    end,
  })
end

vim.api.nvim_create_user_command("SetFuncLineThreshold", function(opts)
  local n = tonumber(opts.args)
  if n then
    M.threshold = n
    print("Fonction threshold update to " .. n)
    M.count()
  else
    print("Usage: :SetFuncLineThreshold <nombre>")
  end
end, {
  nargs = 1
})

M.enable_auto_update()

return M
