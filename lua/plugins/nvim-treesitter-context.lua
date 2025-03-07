return {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
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
    }
}
