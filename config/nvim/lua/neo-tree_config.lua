-- neo-tree

-- Icons
require("nvim-web-devicons").setup({})

require("neo-tree").setup({
    close_if_last_window = false,
    event_handlers = {
        {
            event = "file_opened",
            handler = function(_)
                require("neo-tree.command").execute({ action = "close" })
            end,
        },
    },
})
