-- require('feline').setup()
require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {'NvimTree'},
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
                icons_enabled = true, -- Enables the display of icons alongside the component.
                -- Defines the icon to be displayed in front of the component.
                -- Can be string|table
                -- As table it must contain the icon as first entry and can use
                -- color option to custom color the icon. Example:
                -- {'branch', icon = ''} / {'branch', icon = {'', color={fg='green'}}}
                -- icon position can also be set to the right side from table. Example:
                -- {'branch', icon = {'', align='right', color={fg='green'}}}
                icon = nil,
                separator = nil,      -- Determines what separator to use for the component.
                                      -- Note:
                                      --  When a string is provided it's treated as component_separator.
                                      --  When a table is provided it's treated as section_separator.
                                      --  Passing an empty string disables the separator.
                                      --
                                      -- These options can be used to set colored separators
                                      -- around a component.
                                      --
                                      -- The options need to be set as such:
                                      --   separator = { left = '', right = ''}
                                      --
                                      -- Where left will be placed on left side of component,
                                      -- and right will be placed on its right.
                                      --
                cond = nil,           -- Condition function, the component is loaded when the function returns `true`.
                -- Defines a custom color for the component:
                --
                -- 'highlight_group_name' | { fg = '#rrggbb'|cterm_value(0-255)|'color_name(red)', bg= '#rrggbb', gui='style' } | function
                -- Note:
                --  '|' is synonymous with 'or', meaning a different acceptable format for that placeholder.
                -- color function has to return one of other color types ('highlight_group_name' | { fg = '#rrggbb'|cterm_value(0-255)|'color_name(red)', bg= '#rrggbb', gui='style' })
                -- color functions can be used to have different colors based on state as shown below.
                --
                -- Examples:
                --   color = { fg = '#ffaa88', bg = 'grey', gui='italic,bold' },
                --   color = { fg = 204 }   -- When fg/bg are omitted, they default to the your theme's fg/bg.
                --   color = 'WarningMsg'   -- Highlight groups can also be used.
                --   color = function(section)
                --      return { fg = vim.bo.modified and '#aa3355' or '#33aa88' }
                --   end,
                color = nil, -- The default is your theme's color for that section and mode.
      
                -- Specify what type a component is, if omitted, lualine will guess it for you.
                --
                -- Available types are:
                --   [format: type_name(example)], mod(branch/filename),
                --   stl(%f/%m), var(g:coc_status/bo:modifiable),
                --   lua_expr(lua expressions), vim_fun(viml function name)
                --
                -- Note:
                -- lua_expr is short for lua-expression and vim_fun is short for vim-function.
                type = nil,
      
                padding = 1, -- Adds padding to the left and right of components.
                             -- Padding can be specified to left or right independently, e.g.:
                             --   padding = { left = left_padding, right = right_padding }
      
                fmt = nil,   -- Format function, formats the component's output.
                             -- This function receives two arguments:
                             -- - string that is going to be displayed and
                             --   that can be changed, enhanced and etc.
                             -- - context object with information you might
                             --   need. E.g. tabnr if used with tabs.
                on_click = nil, -- takes a function that is called when component is clicked with mouse.
                             -- the function receives several arguments
                             -- - number of clicks incase of multiple clicks
                             -- - mouse button used (l(left)/r(right)/m(middle)/...)
                             -- - modifiers pressed (s(shift)/c(ctrl)/a(alt)/m(meta)...)  
            },
        },
        lualine_b = {
            {
              'branch',
            },
            {
                'diff',
                colored = true, -- Displays a colored diff status if set to true
                diff_color = {
                  -- Same color values as the general color option can be used here.
                  added    = 'DiffAdd',    -- Changes the diff's added color
                  modified = 'DiffChange', -- Changes the diff's modified color
                  removed  = 'DiffDelete', -- Changes the diff's removed color you
                },
                symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
                source = nil, -- A function that works as a data source for diff.
                              -- It must return a table as such:
                              --   { added = add_count, modified = modified_count, removed = removed_count }
                              -- or nil on failure. count <= 0 won't be displayed.
            }, 
            {
                'diagnostics',
                -- Table of diagnostic sources, available sources are:
                --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
                -- or a function that returns a table as such:
                --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
                sources = { 'nvim_diagnostic', 'coc' },
                -- Displays diagnostics for the defined severity types
                sections = { 'error', 'warn', 'info', 'hint' },
                diagnostics_color = {
                  -- Same values as the general color option can be used here.
                  error = 'DiagnosticError', -- Changes diagnostics' error color.
                  warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
                  info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
                  hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
                },
                symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
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
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
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
                mode = 4, -- 0: Shows buffer name
  --               -- 1: Shows buffer index
  --               -- 2: Shows buffer name + buffer index
  --               -- 3: Shows buffer number
  --               -- 4: Shows buffer name + buffer number

                max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
  --                                          -- it can also be a function that returns
  --                                          -- the value of `max_length` dynamically.
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
                max_length = vim.o.columns / 3, -- Maximum width of tabs component.
                                                -- Note:
                                                -- It can also be a function that returns
                                                -- the value of `max_length` dynamically.
                mode = 0, -- 0: Shows tab_nr
                          -- 1: Shows tab_name
                          -- 2: Shows tab_nr + tab_name
                -- tabs_color = {
                --   -- Same values as the general color option can be used here.
                --   active = 'lualine_{section}_normal',     -- Color for active tab.
                --   inactive = 'lualine_{section}_inactive', -- Color for inactive tab.
                -- },
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
    extensions = { 'nvim-tree', 'fugitive', 'fzf' }
})

require('nvim-web-devicons').setup()

require('nvim-treesitter.configs').setup({
    ensure_installed = { "lua", "yaml", "markdown", "html", "json", "bash", "vim" },
    sync_install = false,
  --   ignore_install = {},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
        disable = { }
    }
})

require('treesitter-context').setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
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
        -- Patterns for specific filetypes
        -- If a pattern is missing, *open a PR* so everyone can benefit.
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
}

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
        dotfiles = true,
        custom = {
            "*.lnk"
        }
    },
    git = {
        enable = true,
        ignore = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400
    },
    hijack_directories = {
        enable = true,
        auto_open = true
    },
    open_on_setup = true,
    open_on_setup_file = true,
    reload_on_bufenter = true,
    renderer = {
        group_empty = true,
        highlight_opened_files = "icon"
    },
    respect_buf_cwd = false,
    root_dirs = { ".git", "*deploiement*" },
    sort_by = "name",
    sync_root_with_cwd = true,
    tab = {
        sync ={
            open = true
        }
    },
    update_focused_file = {
        enable = true,
        update_root = false
    },
    view = {
        adaptive_size = false,
        centralize_selection = false,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
        number = true,
        relativenumber = true,
        width = 30
    }
})

require('which-key').setup({
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>', -- binding to scroll up inside the popup
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by deafult for Telescope
    disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
    },
})

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
        color = nil,
        cterm = nil,
        highlight = "CursorColumn",
        hide_if_all_visible = true, -- Hides handle if all lines are visible
    },
    marks = {
        Cursor = {
            text = "•",
            priority = 0,
            color = nil,
            cterm = nil,
            highlight = "Normal",
        },
        Search = {
            text = { "-", "=" },
            priority = 1,
            color = nil,
            cterm = nil,
            highlight = "Search",
        },
        Error = {
            text = { "-", "=" },
            priority = 2,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextError",
        },
        Warn = {
            text = { "-", "=" },
            priority = 3,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextWarn",
        },
        Info = {
            text = { "-", "=" },
            priority = 4,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextInfo",
        },
        Hint = {
            text = { "-", "=" },
            priority = 5,
            color = nil,
            cterm = nil,
            highlight = "DiagnosticVirtualTextHint",
        },
        Misc = {
            text = { "-", "=" },
            priority = 6,
            color = nil,
            cterm = nil,
            highlight = "Normal",
        },
        GitAdd = {
            text = "┆",
            priority = 7,
            color = nil,
            cterm = nil,
            highlight = "GitSignsAdd",
        },
        GitChange = {
            text = "┆",
            priority = 7,
            color = nil,
            cterm = nil,
            highlight = "GitSignsChange",
        },
        GitDelete = {
            text = "▁",
            priority = 7,
            color = nil,
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
        add          = { hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
        change       = { hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
        delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
        topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
        untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = true, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = true, -- Toggle with `:Gitsigns toggle_word_diff`
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
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
    },
    yadm = {
      enable = false
    },
})

require('indent_blankline').setup({
    show_end_of_line = true,
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
})

require('tokyonight').setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = false, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
    },
    sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
    day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
    dim_inactive = true, -- dims inactive windows
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

    --- You can override specific color groups to use other groups or a hex color
    --- function will be called with a ColorScheme table
    ---@param colors ColorScheme
    on_colors = function(colors) end,

    --- You can override specific highlights to use other groups or a hex color
    --- function will be called with a Highlights and ColorScheme table
    ---@param highlights Highlights
    ---@param colors ColorScheme
    on_highlights = function(highlights, colors) end,
})

require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt" , "vim" },
})

require('workspaces').setup({
    -- path to a file to store workspaces data in
    -- on a unix system this would be ~/.local/share/nvim/workspaces
    path = vim.fn.stdpath("data") .. "/workspaces",

    -- to change directory for all of nvim (:cd) or only for the current window (:lcd)
    -- if you are unsure, you likely want this to be true.
    global_cd = true,

    -- sort the list of workspaces by name after loading from the workspaces path.
    sort = true,

    -- sort by recent use rather than by name. requires sort to be true
    mru_sort = true,

    -- enable info-level notifications after adding or removing a workspace
    notify_info = true,

    -- lists of hooks to run after specific actions
    -- hooks can be a lua function or a vim command (string)
    -- lua hooks take a name, a path, and an optional state table
    -- if only one hook is needed, the list may be omitted
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
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --     picker_config_key = value,
        --     ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --     extension_config_key = value,
        -- }
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
        hl = { underline = true },
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

