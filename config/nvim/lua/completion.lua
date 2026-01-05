-- lua/completion.lua
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local in_menu = false

cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done()
)

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
    },

    mapping = {
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                in_menu = true
                cmp.select_next_item()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                in_menu = true
                cmp.select_prev_item()
            else
                cmp.complete()
            end
        end, { "i", "s" }),

        ["<Space>"] = cmp.mapping(function(fallback)
            if in_menu then
                cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Insert })
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(" ", true, false, true), "n", false)
                in_menu = false
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true })
                in_menu = false
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<Esc>"] = cmp.mapping(function(fallback)
            cmp.abort()
            in_menu = false
            fallback()
        end, { "i", "s" }),
    },

    window = {
        completion = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:PmenuSel,Search:None"
        }),
        documentation = cmp.config.window.bordered({
            border = "rounded",
            winhighlight = "Normal:Normal,FloatBorder:Normal,CursorLine:PmenuSel,Search:None"
        }),
    },
})

