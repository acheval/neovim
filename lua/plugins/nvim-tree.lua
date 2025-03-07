return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    init = function()
        local autocmd = vim.api.nvim_create_autocmd

        autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup(
                "NvimTreeClose",
                { clear = true }
            ),
            pattern = "NvimTree_*",
            callback = function()
                local layout = vim.api.nvim_call_function("winlayout", {})
                if
                    layout[1] == "leaf"
                    and vim.api.nvim_buf_get_option(
                        vim.api.nvim_win_get_buf(layout[2]),
                        "filetype"
                    ) == "NvimTree"
                    and layout[3] == nil
                then
                    vim.cmd("confirm quit")
                end
            end,
        })

        autocmd({ "VimEnter" }, {
            -- open nvim-tree for noname buffers and directory
            callback = function(args)
                -- buffer is a [No Name]
                local no_name = args.file == ""
                    and vim.bo[args.buf].buftype == ""
                -- buffer is a directory
                local directory = vim.fn.isdirectory(args.file) == 1

                local api = require("nvim-tree.api")

                if directory then
                    -- change to the directory
                    vim.cmd.cd(args.file)
                    -- open the tree
                    api.tree.open()
                elseif no_name then
                    -- open the tree
                    api.tree.open()
                else
                    -- open the tree, find the file but don't focus it
                    api.tree.toggle({ focus = false, find_file = true })
                end
            end
        })
    end,
    opts = {
        auto_reload_on_write = true,
        actions = {
            change_dir = {
                enable = true,
                global = true,
                restrict_above_cwd = true
            }
        },
        filesystem_watchers = {
            enable = true
        },
        filters = {
            dotfiles = false,
            custom = {
                "*.lnk"
            }
        },
        git = {
            enable = true,
            ignore = false,
            show_on_dirs = true,
            show_on_open_dirs = true,
            timeout = 400
        },
        hijack_cursor = true,
        hijack_directories = {
            enable = true,
            auto_open = true
        },
        prefer_startup_root = true,
        reload_on_bufenter = true,
        renderer = {
            group_empty = true,
            highlight_git = "all",
            highlight_opened_files = "icon",
            symlink_destination = false,
        },
        respect_buf_cwd = false,
        root_dirs = { 
            ".git"
        },
        sort_by = "name",
        sync_root_with_cwd = true,
        tab = {
            sync ={
                open = true
            }
        },
        update_focused_file = {
            enable = true,
            update_root = true
        },
        view = {
            adaptive_size = true,
            centralize_selection = false,
            number = false,
            relativenumber = false,
            -- width = 30
        },
    },
}
