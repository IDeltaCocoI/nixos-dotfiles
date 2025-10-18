local M = {}

M.setup = function()
    local colors = {
        bg        = "#282c34", -- Fond sombre
        fg        = "#abb2bf", -- Texte principal
        blue      = "#61afef", -- Fonctions
        purple    = "#c678dd", -- Mots-clés
        cyan      = "#56b6c2", -- Identifiants
        magenta   = "#e06c75", -- Opérateurs
        yellow    = "#e5c07b", -- Types et conditionnels
        orange    = "#d19a66", -- Nombres
        green     = "#98c379", -- Chaînes de caractères
        red       = "#be5046", -- Erreurs
        gray      = "#5c6370", -- Commentaires, numéros de ligne
        cursorbg  = "#3e4452", -- Ligne active
        selection = "#3e4452", -- Sélection visuelle
    }

    -- Fond et texte
    vim.cmd("highlight Normal guibg=none guifg=" .. colors.fg)

    -- Commentaires
    vim.cmd("highlight Comment guifg=" .. colors.gray .. " gui=italic")

    -- Mots-clés et structures conditionnelles
    vim.cmd("highlight Keyword guifg=" .. colors.purple .. " gui=bold")
    vim.cmd("highlight Conditional guifg=" .. colors.yellow .. " gui=bold")

    -- Fonctions
    vim.cmd("highlight Function guifg=" .. colors.blue .. " gui=bold")

    -- Variables et identifiants
    vim.cmd("highlight Identifier guifg=" .. colors.cyan)

    -- Chaînes de caractères
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
    vim.cmd("highlight PmenuSel guibg=" .. colors.blue .. " guifg=#ffffff")

    -- Diagnostics (LSP)
    vim.cmd("highlight DiagnosticError guifg=" .. colors.red)
    vim.cmd("highlight DiagnosticWarn guifg=" .. colors.orange)
    vim.cmd("highlight DiagnosticInfo guifg=" .. colors.blue)
    vim.cmd("highlight DiagnosticHint guifg=" .. colors.cyan)
end

return M

