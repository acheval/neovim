return {
    'nvim-lualine/lualine.nvim',
    opts = {
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
    }
}
