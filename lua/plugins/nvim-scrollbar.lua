return {
    'petertriho/nvim-scrollbar',
    config = function()
        require("tokyonight.colors").setup()
    end,
    opts = {
        show = true,
        show_in_active_only = false,
        set_highlights = true,
        folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
        max_lines = false, -- disables if no. of lines in buffer exceeds this
        hide_if_all_visible = false, -- Hides everything if all lines are visible
        throttle_ms = 100,
        handle = {
            text = " ",
            color = bg_highlight,
            cterm = nil,
            highlight = "CursorColumn",
            hide_if_all_visible = true, -- Hides handle if all lines are visible
        },
        marks = {
            Cursor = {
                text = "•",
                priority = 0,
                color = white,
                cterm = nil,
                highlight = "Normal",
            },
            Search = {
                text = {
                  "-",
                  "="
                },
                priority = 1,
                color = orange,
                cterm = nil,
                highlight = "Search",
            },
            Error = {
                text = {
                  "-",
                  "="
                },
                priority = 2,
                color = error,
                cterm = nil,
                highlight = "DiagnosticVirtualTextError",
            },
            Warn = {
                text = {
                  "-",
                  "="
                },
                priority = 3,
                color = warning,
                cterm = nil,
                highlight = "DiagnosticVirtualTextWarn",
            },
            Info = {
                text = {
                  "-",
                  "="
                },
                priority = 4,
                color = info,
                cterm = nil,
                highlight = "DiagnosticVirtualTextInfo",
            },
            Hint = {
                text = {
                  "-",
                  "="
                },
                priority = 5,
                color = hint,
                cterm = nil,
                highlight = "DiagnosticVirtualTextHint",
            },
            Misc = {
                text = {
                  "-",
                  "="
                },
                priority = 6,
                color = purple,
                cterm = nil,
                highlight = "Normal",
            },
            GitAdd = {
                text = "┆",
                priority = 7,
                color = green,
                cterm = nil,
                highlight = "GitSignsAdd",
            },
            GitChange = {
                text = "┆",
                priority = 7,
                color = yellow,
                cterm = nil,
                highlight = "GitSignsChange",
            },
            GitDelete = {
                text = "▁",
                priority = 7,
                color = red,
                cterm = nil,
                highlight = "GitSignsDelete",
            },
        },
        excluded_buftypes = {
            "terminal",
        },
        excluded_filetypes = {
            "prompt",
            "TelescopePrompt",
            "noice",
        },
        autocmd = {
            render = {
                "BufWinEnter",
                "TabEnter",
                "TermEnter",
                "WinEnter",
                "CmdwinLeave",
                "TextChanged",
                "VimResized",
                "WinScrolled",
            },
            clear = {
                "BufWinLeave",
                "TabLeave",
                "TermLeave",
                "WinLeave",
            },
        },
        handlers = {
            cursor = true,
            diagnostic = true,
            gitsigns = true, -- Requires gitsigns
            handle = true,
            search = false, -- Requires hlslens
        },
    }
}
