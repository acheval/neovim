-- Import & assign the map() function from the utils module
local map = require('scripts.remap').map

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

-- Find files using Telescope command-line sugar.
map('n', '<Leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<Leader>lg', '<cmd>Telescope live_grep<cr>')
map('n', '<Leader>gs', '<cmd>Telescope grep_string<cr>')
map('n', '<Leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<Leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<Leader>tr', '<cmd>Telescope resume<cr>')

------------------
-- Git Mappings --
------------------
map('n', '<Leader>ga', '<cmd>Git add %<cr>')
map('n', '<Leader>gA', '<cmd>Git add .<cr>')
map('n', '<Leader>gc', '<cmd>Git commit<cr>')
map('n', '<Leader>gp', '<cmd>Git push<cr>')
map('n', '<Leader>gbt', '<cmd>Gitsigns toggle_current_line_blame<cr>')
map('n', '<Leader>gr', '<cmd>Git reset %<cr>')
map('n', '<Leader>gR', '<cmd>Git reset .<cr>')
map('n', '<Leader>gS', '<cmd>Git status<cr>')

---------------------
-- Packer Mappings --
---------------------

-- toggle NvimTree
map('n', '<Leader>pi', '<cmd>PackerInstall<CR>')
map('n', '<Leader>ps', '<cmd>PackerSync<CR>')
