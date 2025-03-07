return {
    'natecraddock/workspaces.nvim',
    opts = {
        path = vim.fn.stdpath("data") .. "/workspaces",
        global_cd = true,
        sort = true, -- sort the list of workspaces by name after loading from the workspaces path.
        mru_sort = true, -- sort by recent use rather than by name. requires sort to be true
        notify_info = true, -- enable info-level notifications after adding or removing a workspace
        hooks = {
            add = {},
            remove = {},
            rename = {},
            open_pre = {},
            open = {
                'NvimTreeOpen',
                'Telescope find_files'
            },
        },
    },
}
