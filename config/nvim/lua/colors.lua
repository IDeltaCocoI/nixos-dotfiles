-- ~/.config/nvim/lua/color.lua
local M = {}

M.setup = function()
    -- Palette futuriste douce
    local colors = {
        bg        = "#1a1b2e", -- fond sombre
        fg        = "#e0e0f0", -- texte principal
        blue      = "#7aa2f7",
        purple    = "#c678dd",
        cyan      = "#56b6c2",
        magenta   = "#d16dff",
        yellow    = "#e5c07b",
        orange    = "#ff9e64",
        green     = "#98c379",
        red       = "#f7768e",
        gray      = "#565f89",
        cursorbg  = "#2c2f4a",
        selection = "#2a2d3e",
    }

    -- Fond et texte
    vim.cmd("highlight Normal guibg=" .. colors.bg .. " guifg=" .. colors.fg)

    -- Commentaires
    vim.cmd("highlight Comment guifg=" .. colors.gray .. " gui=italic")

    -- Mots-clés et structures conditionnelles
    vim.cmd("highlight Keyword guifg=" .. colors.purple .. " gui=bold")
    vim.cmd("highlight Conditional guifg=" .. colors.yellow .. " gui=bold") -- if / else / elseif

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

