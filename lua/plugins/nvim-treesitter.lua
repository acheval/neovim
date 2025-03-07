return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    init = function(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    cmd = {
        "TSUpdateSync",
        "TSUpdate",
        "TSInstall"
    },
    opts = {
        ensure_installed = {
            "bash",
            "groovy",
            "html",
            "htmldjango",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "query",
            "sql",
            "terraform",
            "vim",
            "vimdoc",
            "yaml"
        },
        sync_install = false,
        ignore_install = {},
        indent = {
            enable = true,
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true,
            disable = { }
        }
    }
}
