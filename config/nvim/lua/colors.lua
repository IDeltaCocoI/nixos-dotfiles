-- color.lua
local M = {}

M.setup = function()
    -- Palette spatiale douce
    local colors = {
        bg        = "#1c1f2b", -- fond sombre mais pas trop
        fg        = "#e5e5e5", -- texte principal clair
        blue      = "#82aaff",
        purple    = "#c792ea",
        cyan      = "#89ddff",
        magenta   = "#f07178",
        yellow    = "#ffcb6b",
        orange    = "#f78c6c",
        green     = "#c3e88d",
        red       = "#f07178",
        gray      = "#7f849c",
        cursorbg  = "#2e313c",
        selection = "#3a3f58",
    }

    -- Fond et texte
    vim.cmd("highlight Normal guibg=" .. colors.bg .. " guifg=" .. colors.fg)

    -- Commentaires
    vim.cmd("highlight Comment guifg=" .. colors.gray .. " gui=italic")

    -- Mots-clés et structures conditionnelles
    vim.cmd("highlight Keyword guifg=" .. colors.purple .. " gui=bold")
    vim.cmd("highlight Conditional guifg=" .. colors.yellow .. " gui=bold")

    -- Fonctions
    vim.cmd("highlight Function guifg=" .. colors.blue .. " gui=bold")

    -- Variables et identifiants
    vim.cmd("highlight Identifier guifg=" .. colors.cyan)

    -- Strings
    vim.cmd("highlight String guifg=" .. colors.green)

    -- Nombres
    vim.cmd("highlight Number guifg=" .. colors.orange)

    -- Types
    vim.cmd("highlight Type guifg=" .. colors.yellow .. " gui=bold")

    -- Opérateurs
    vim.cmd("highlight Operator guifg=" .. colors.magenta)

    -- Curseur et ligne active
    vim.cmd("highlight CursorLine guibg=" .. colors.cursorbg)
    vim.cmd("highlight CursorLineNr guifg=" .. colors.blue .. " gui=bold")
    vim.cmd("highlight LineNr guifg=" .. colors.gray)

    -- Sélection visuelle
    vim.cmd("highlight Visual guibg=" .. colors.selection)

    -- Pmenu (autocomplete)
    vim.cmd("highlight Pmenu guibg=" .. colors.cursorbg .. " guifg=" .. colors.fg)
    vim.cmd("highlight PmenuSel guibg=" .. colors.purple .. " guifg=#ffffff")

    -- Diagnostics (LSP)
    vim.cmd("highlight DiagnosticError guifg=" .. colors.red)
    vim.cmd("highlight DiagnosticWarn guifg=" .. colors.orange)
    vim.cmd("highlight DiagnosticInfo guifg=" .. colors.blue)
    vim.cmd("highlight DiagnosticHint guifg=" .. colors.cyan)
end

return M

