require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { 
          left = '',
          right = ''
        },
        section_separators = { 
          left = '',
          right = ''
        },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {
          'NvimTree'
        },
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {
            {
                'mode',
                icons_enabled = true,
                icon = nil,
                separator = nil,
                cond = nil,
                color = nil,
                type = nil,
                padding = 1,
                fmt = nil,
                on_click = nil,            },
        },
        lualine_b = {
            {
              'branch',
            },
            {
                'diff',
                colored = true, -- Displays a colored diff status if set to true
                diff_color = {
                    added    = 'DiffAdd',    -- Changes the diff's added color
                    modified = 'DiffChange', -- Changes the diff's modified color
                    removed  = 'DiffDelete', -- Changes the diff's removed color you
                },
                symbols = {
                    added = '+',
                    modified = '~',
                    removed = '-'
                },
                source = nil,
            },
            {
                'diagnostics',
                sources = { 
                    'nvim_diagnostic',
                    'coc'
                },
                sections = {
                    'error',
                    'warn',
                    'info',
                    'hint'
                },
                diagnostics_color = {
                    error = 'DiagnosticError', -- Changes diagnostics' error color.
                    warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                    info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                    hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                },
                symbols = {
                    error = 'E',
                    warn = 'W',
                    info = 'I',
                    hint = 'H'
                },
                colored = true,           -- Displays diagnostics status in color if set to true.
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = false,   -- Show diagnostics even if there are none.
            },
        },
        lualine_c = {
            {
                'filename',
                file_status = true,      -- Displays file status (readonly status, modified status)
                newfile_status = true,  -- Display new file status (new file means no write after created)
                path = 0,                -- 0: Just the filename -- 1: Relative path -- 2: Absolute path -- 3: Absolute path, with tilde as the home directory
                shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                symbols = {
                    modified = '[+]',      -- Text to show when the file is modified.
                    readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                    newfile = '[New]',     -- Text to show for new created file before first writting
                }
            },
            'hlsearch'
        },
        lualine_x = {
            'encoding',
            'fileformat',
            'filetype'
        },
        lualine_y = {
            'progress'
        },
        lualine_z = {
            'location'
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            'filename'
        },
        lualine_x = {
            'location'
        },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {
            {
                'buffers',
                show_filename_only = false,   -- Shows shortened relative path when set to false.
                hide_filename_extension = true,   -- Hide filename extension when set to true.
                show_modified_status = true, -- Shows indicator when the buffer is modified.
                mode = 2,
                max_length = vim.o.columns * 2 / 3,
                filetype_names = {
                    TelescopePrompt = 'Telescope',
                    dashboard = 'Dashboard',
                    packer = 'Packer',
                    fzf = 'FZF',
                    alpha = 'Alpha',
                    nvimtree = 'NvimTree'
                }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
                symbols = {
                    modified = ' ●',      -- Text to show when the buffer is modified
                    alternate_file = '#', -- Text to show to identify the alternate file
                    directory =  '',     -- Text to show when the buffer is a directory
                },
            },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            {
                'tabs',
                max_length = vim.o.columns / 3,
                mode = 0,
                fmt = function(name, context)
                    -- Show + if buffer is modified in tab
                    local buflist = vim.fn.tabpagebuflist(context.tabnr)
                    local winnr = vim.fn.tabpagewinnr(context.tabnr)
                    local bufnr = buflist[winnr]
                    local mod = vim.fn.getbufvar(bufnr, '&mod')
                    return name .. (mod == 1 and ' +' or '')
                end
            }
        },
    },
    winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    extensions = { 
        'nvim-tree',
        'fugitive',
        'fzf'
    }
})

require('nvim-web-devicons').setup()

require('nvim-treesitter.configs').setup({
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
    sync_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
        disable = { }
    }
})

require('treesitter-context').setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    patterns = {
        default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
            'interface',
            'struct',
            'enum',
        },
        tex = {
            'chapter',
            'section',
            'subsection',
            'subsubsection',
        },
        markdown = {
            'section',
        },
        json = {
            'pair',
        },
        yaml = {
            'block_mapping_pair',
        },
    },
    exact_patterns = {
            -- Example for a specific filetype with Lua patterns
            -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
            -- exactly match "impl_item" only)
            -- rust = true,
    },
})

require('nvim-tree').setup({
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
    }
})

require("nvim-tree.api").tree.toggle({
    focus = false, 
    find_file = true
})

require('which-key').setup({
    defaults = {
        preset = "helix", ---@type false | "classic" | "modern" | "helix"
        delay = function(ctx)
            return ctx.plugin and 0 or 200
        end,
        filter = function(mapping) ---@param mapping wk.Mapping
            return mapping.desc and mapping.desc ~= ""
            --return true
        end,
        spec = {},
        notify = true,
        triggers = {
            {
              "<auto>",
              mode = "nxso"
            },
        },
        defer = function(ctx)
            return ctx.mode == "V" or ctx.mode == "<C-V>"
        end,
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 50, -- how many suggestions should be shown in the list?
            },
            presets = {
                operators = true, -- adds help for operators like d, y, ...
                motions = true, -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = true, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
        win = {
            no_overlap = true,
            width = 1,
            height = {
              min = 4,
              max = 25
            },
            col = 0,
            row = math.huge,
            border = "none",
            padding = {
              1,
              2
            }, -- extra window padding [top/bottom, right/left]
            title = true,
            title_pos = "center",
            zindex = 1000,
            -- Additional vim.wo and vim.bo options
            bo = {},
            wo = {
                winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
            },
        },
        layout = {
            width = {
              min = 20
            }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
        },
        keys = {
            scroll_down = "<c-d>", -- binding to scroll down inside the popup
            scroll_up = "<c-u>", -- binding to scroll up inside the popup
        },
        sort = { 
            "local",
            "order",
            "group",
            "alphanum",
            "mod"
        },
        expand = function(node)
            return not node.desc -- expand all nodes without a description
        end,
        -- Functions/Lua Patterns for formatting the labels
        ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
        replace = {
            key = {
                function(key)
                    return require("which-key.view").format(key)
                end,
                -- { "<Space>", "SPC" },
            },
            desc = {
                {
                  "<Plug>%(?(.*)%)?",
                  "%1"
                },
                {
                  "^%+",
                  ""
                },
                {
                  "<[cC]md>",
                  ""
                },
                {
                  "<[cC][rR]>",
                  ""
                },
                {
                  "<[sS]ilent>",
                  ""
                },
                {
                  "^lua%s+",
                  ""
                },
                {
                  "^call%s+",
                  ""
                },
                {
                  "^:%s*",
                  ""
                },
            },
        },
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "+", -- symbol prepended to a group
            ellipsis = "…",
            mappings = true,
            rules = {},
            colors = true,
            keys = {
                Up = " ",
                Down = " ",
                Left = " ",
                Right = " ",
                C = "󰘴 ",
                M = "󰘵 ",
                D = "󰘳 ",
                S = "󰘶 ",
                CR = "󰌑 ",
                Esc = "󱊷 ",
                ScrollWheelDown = "󱕐 ",
                ScrollWheelUp = "󱕑 ",
                NL = "󰌑 ",
                BS = "󰁮",
                Space = "󱁐 ",
                Tab = "󰌒 ",
                F1 = "󱊫",
                F2 = "󱊬",
                F3 = "󱊭",
                F4 = "󱊮",
                F5 = "󱊯",
                F6 = "󱊰",
                F7 = "󱊱",
                F8 = "󱊲",
                F9 = "󱊳",
                F10 = "󱊴",
                F11 = "󱊵",
                F12 = "󱊶",
            },
        },
        show_help = true, -- show a help message in the command line for using WhichKey
        show_keys = true, -- show the currently pressed key and its label as a message in the command line
        disable = {
            ft = {},
            bt = {},
        },
        debug = false, -- enable wk.log in the current directory
     }
})

local colors = require("tokyonight.colors").setup()
require('scrollbar').setup({
    show = true,
    show_in_active_only = false,
    set_highlights = true,
    folds = 1000, -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
    max_lines = false, -- disables if no. of lines in buffer exceeds this
    hide_if_all_visible = false, -- Hides everything if all lines are visible
    throttle_ms = 100,
    handle = {
        text = " ",
        color = colors.bg_highlight,
        cterm = nil,
        highlight = "CursorColumn",
        hide_if_all_visible = true, -- Hides handle if all lines are visible
    },
    marks = {
        Cursor = {
            text = "•",
            priority = 0,
            color = colors.white,
            cterm = nil,
            highlight = "Normal",
        },
        Search = {
            text = {
              "-",
              "="
            },
            priority = 1,
            color = colors.orange,
            cterm = nil,
            highlight = "Search",
        },
        Error = {
            text = {
              "-",
              "="
            },
            priority = 2,
            color = colors.error,
            cterm = nil,
            highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
            text = {
              "-",
              "="
            },
            priority = 3,
            color = colors.warning,
            cterm = nil,
            highlight = "DiagnosticVirtualTextWarn",
        },
        Info = {
            text = {
              "-",
              "="
            },
            priority = 4,
            color = colors.info,
            cterm = nil,
            highlight = "DiagnosticVirtualTextInfo",
        },
        Hint = {
            text = {
              "-",
              "="
            },
            priority = 5,
            color = colors.hint,
            cterm = nil,
            highlight = "DiagnosticVirtualTextHint",
        },
        Misc = {
            text = {
              "-",
              "="
            },
            priority = 6,
            color = colors.purple,
            cterm = nil,
            highlight = "Normal",
        },
        GitAdd = {
            text = "┆",
            priority = 7,
            color = colors.green,
            cterm = nil,
            highlight = "GitSignsAdd",
        },
        GitChange = {
            text = "┆",
            priority = 7,
            color = colors.yellow,
            cterm = nil,
            highlight = "GitSignsChange",
        },
        GitDelete = {
            text = "▁",
            priority = 7,
            color = colors.red,
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
})


require('gitsigns').setup({
    signs = {
        add = {
          text = '│'
        },
        change = {
          text = '│'
        },
        delete = {
          text = '_'
        },
        topdelete = {
          text = '‾'
        },
        changedelete = {
          text = '~'
        },
        untracked = {
          text = '┆'
        },
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = true, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = true, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'right_align', -- 'eol' | 'overlay' | 'right_align'
        delay = 500,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
    }
})

require('ibl').setup({
    scope = {
        enabled = true,
        show_start = true,
        show_end = true,
    },
})

require('tokyonight').setup({
    style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = false, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
        comments = {
          italic = true
        },
        keywords = {
          italic = true
        },
        functions = {},
        variables = {},
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
    },
    sidebars = {
      "qf",
      "help"
    }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = true, -- dims inactive windows
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
    on_colors = function(colors) end,
    on_highlights = function(highlights, colors) end,
})

require('nvim-autopairs').setup({
    disable_filetype = {
      "TelescopePrompt",
      "vim"
    },
})

require('workspaces').setup({
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
        },
    },
})

require('telescope').setup{
    defaults = {
        mappings = {
            i = {
            }
        }
    },
    pickers = {
    },
    extensions = {
        coc = {
            -- theme = 'ivy',
            prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
            push_cursor_on_edit = true, -- save the cursor position to jump back in the future
            timeout = 3000, -- timeout for coc commands
        },
        workspaces = {
            -- keep insert mode after selection in the picker, default is false
            keep_insert = true,   -- please take a look at the readme of the extension you want to configure
        },
    },
}

require('nvim-cursorline').setup({
    cursorline = {
        enable = false,
    },
    cursorword = {
        enable = true,
        min_length = 2,
        hl = {
          underline = true
        },
    }
  })

require('git-conflict').setup({
    default_mappings = true, -- disable buffer local mapping created by this plugin
    default_commands = true, -- disable commands created by this plugin
    disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
    highlights = { -- They must have background color, otherwise the default color will be used
        incoming = 'DiffText',
        current = 'DiffAdd',
    }
})

