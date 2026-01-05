local M = {}

local ts = vim.treesitter
local ns = vim.api.nvim_create_namespace("c_func_lines")

local threshold_path = vim.fn.stdpath("state") .. "/c_func_line_threshold.txt"
local threshold_cache ---@type number|nil

local function read_threshold_file()
  local f = io.open(threshold_path, "r")
  if not f then return nil end
  local content = f:read("*a") or ""
  f:close()

  local n = tonumber(content:match("%-?%d+"))
  if n and n >= 0 then
    return n
  end
  return nil
end

local function write_threshold_file(n)
  local dir = vim.fn.fnamemodify(threshold_path, ":h")
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end

  local f, err = io.open(threshold_path, "w")
  if not f then
    vim.notify("countline: impossible d'écrire " .. threshold_path .. " (" .. tostring(err) .. ")", vim.log.levels.WARN)
    return
  end
  f:write(tostring(n))
  f:close()
end

local function set_threshold(n, persist)
  threshold_cache = n
  vim.g.c_func_line_threshold = n
  if persist then
    write_threshold_file(n)
  end
end

local function ensure_threshold()
  if threshold_cache == nil then
    local from_disk = read_threshold_file()
    if from_disk ~= nil then
      set_threshold(from_disk, false)
    else
      local gval = tonumber(vim.g.c_func_line_threshold)
      set_threshold(gval or 30, false)
    end
  else
    if tonumber(vim.g.c_func_line_threshold) ~= threshold_cache then
      vim.g.c_func_line_threshold = threshold_cache
    end
  end

  return threshold_cache
end

ensure_threshold()

local function is_ignorable(line)
  local trimmed = line:match("^%s*(.-)%s*$")
  if trimmed == "" then return true end
  if trimmed == "{" or trimmed == "}" then return true end
  if trimmed:match("^//") then return true end
  if trimmed:match("^/%*") then return true end
  return false
end

local function count_function_lines(bufnr, func_node)
  local start_row, _, end_row, _ = func_node:range()

  local declarator_end_row = start_row
  for child in func_node:iter_children() do
    if child:type() == "function_declarator" then
      local _, _, r, _ = child:range()
      declarator_end_row = r
      break
    end
  end

  local count = 0
  for row = declarator_end_row + 1, end_row do
    local line = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1] or ""
    if not is_ignorable(line) then
      count = count + 1
    end
  end

  return count, start_row
end

function M.count()
  local bufnr = vim.api.nvim_get_current_buf()

  local ext = vim.fn.expand("%:e")
  if ext ~= "c" and ext ~= "h" then
    return
  end

  local ok, parser = pcall(ts.get_parser, bufnr, "c")
  if not ok then
    if not vim.g._countline_warned_no_c_parser then
      vim.g._countline_warned_no_c_parser = true
      vim.notify("countline: parser Tree-sitter 'c' introuvable. Installe nvim-treesitter + parser C.", vim.log.levels.WARN)
    end
    return
  end

  local tree = parser:parse()[1]
  local root = tree:root()

  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)

  local query = ts.query.parse("c", [[
    (function_definition
      declarator: (function_declarator)
    ) @func
  ]])

  local threshold = ensure_threshold()

  for _, node in query:iter_captures(root, bufnr, 0, -1) do
    local count, start_row = count_function_lines(bufnr, node)
    local hl = (count > threshold) and "Error" or "Comment"

    vim.api.nvim_buf_set_extmark(bufnr, ns, start_row, 0, {
      virt_text = { { "-- " .. count .. " lines", hl } },
      virt_text_pos = "eol",
    })
  end
end

local group = vim.api.nvim_create_augroup("CFuncLines", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "TextChangedI" }, {
  group = group,
  pattern = { "*.c", "*.h" },
  callback = function()
    require("countline").count()
  end,
})

vim.api.nvim_create_user_command("SetFuncLineThreshold", function(opts)
  local n = tonumber(opts.args)
  if not n then
    print("Usage: :SetFuncLineThreshold <number>")
    return
  end

  set_threshold(n, true)
  print(("Function line threshold set to %d (saved: %s)"):format(n, threshold_path))
  M.count()
end, { nargs = 1 })

vim.api.nvim_create_user_command("FuncLineThreshold", function()
  local t = ensure_threshold()
  print(("Current threshold = %d | saved in: %s"):format(t, threshold_path))
end, {})

return M
