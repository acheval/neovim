return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
        'fannheyward/telescope-coc.nvim',
        'kkharji/sqlite.lua',
        -- 'sharkdp/fd', -- External dep required for live-grep 
        -- 'BurntSushi/ripgrep', -- External dep required for live-grep
    },
    opts = {
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
           nerdy = {
           },
       },
    },
}
