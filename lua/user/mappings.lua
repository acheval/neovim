-- Import & assign the map() function from the utils module
local map = require('functions.remap').map

---------------------
-- Neovim mappings --
---------------------

-- Change Leader to space
map('n', '<SPACE>', '<Nop>', { noremap = true })
vim.g.mapleader = " "

-- Reload config
map('n', '<Leader>rc', '<cmd>lua ReloadConfig()<CR>')

--- Mapping yank and paste
map('i', '<S-Insert>', '<C-R>+')
map('n', '<S-Insert>', 'p')
map('n', 'Y', 'yy')
map('n', 'U', '<C-r>')

-- Change split orientation
map('n', '<Leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<Leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Manage Font size
-- map({'n', 'i'}, '<C-ScrollWheelDown>', ':call AdjustFontSize(-1)<CR>')
-- map({'n', 'i'}, '<C-ScrollWheelUp>', ':call AdjustFontSize(1)<CR>')
map('n', '<Leader><F11>', '<cmd>call GuiFont("DejaVuSansMono NFM:10")<CR>')

-- Buffer
map('n', '<Leader>bd', '<cmd>Bdelete<CR>')
map('n', '<Leader>bp', '<cmd>bprevious<CR>')
map('n', '<Leader>bn', '<cmd>bnext<CR>')

-- disable Ex mode
map('n', 'Q', 'q:')

-- lazy escape
map('i', 'kj', '<ESC>')
map('c', 'kj', '<ESC>')
map('i', 'KJ', '<ESC>')
map('c', 'KJ', '<ESC>')

-----------------------
-- NvimTree Mappings --
-----------------------

-- toggle NvimTree
map('n', '<Leader>nt', '<cmd>NvimTreeToggle<CR>')

------------------------
-- Telescope Mappings --
------------------------

-- Find
map('n', '<Leader>tff', '<cmd>Telescope find_files<cr>')
map('v', '<Leader>tff', '<cmd>Telescope find_files<cr>')
map('n', '<Leader>tfr', '<cmd>Telescope frecency workspace=CWD<cr>')
map('n', '<Leader>tlg', '<cmd>Telescope live_grep<cr>')
map('v', '<Leader>tlg', '<cmd>Telescope live_grep<cr>')
map('n', '<Leader>tgs', '<cmd>Telescope grep_string<cr>')
map('v', '<Leader>tgs', '<cmd>Telescope grep_string<cr>')
map('n', '<Leader>tfb', '<cmd>Telescope buffers<cr>')

-- Git
map('n', '<Leader>tgb', '<cmd>Telescope git_branches<cr>')
map('n', '<Leader>tgc', '<cmd>Telescope git_commits<cr>')

-- Coc
map('n', '<Leader>tdi', '<cmd>Telescope coc diagnostics<cr>')
map('n', '<Leader>tdc', '<cmd>Telescope coc declarations<cr>')
map('n', '<Leader>tdf', '<cmd>Telescope coc definitions<cr>')

-- Misc
map('n', '<Leader>tfh', '<cmd>Telescope help_tags<cr>')
map('n', '<Leader>tre', '<cmd>Telescope resume<cr>')

------------------
-- Git Mappings --
------------------
map('n', '<Leader>ga', '<cmd>Git add %<cr>') -- Git stage current file
map('n', '<Leader>gA', '<cmd>Git add .<cr>') -- Git unstage current file
map('n', '<Leader>gc', '<cmd>Git commit<cr>')
map('n', '<Leader>gp', '<cmd>Git push<cr>')
map('n', '<Leader>gP', '<cmd>Git pull<cr>')
map('n', '<Leader>gbt', '<cmd>Gitsigns toggle_current_line_blame<cr>')
map('n', '<Leader>gr', '<cmd>Git reset %<cr>') -- Git unstage current file
map('n', '<Leader>gR', '<cmd>Git reset .<cr>') -- Git unstage all files
map('n', '<Leader>gs', '<cmd>Git status<cr>')
map('n', '<Leader>glg', '<cmd>:LazyGit<cr>')

---------------------
-- Packer Mappings --
---------------------

map('n', '<Leader>pi', '<cmd>PackerInstall<CR>')
map('n', '<Leader>ps', '<cmd>PackerSync<CR>')
