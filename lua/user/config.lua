-------------------------------------------------------------------------------
-- tips from
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
--
--
-------------------------------------------------------------------------------

local exec = vim.api.nvim_exec -- execute Vimscript
local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local b = vim.bo -- buffer-scoped options
local w = vim.wo -- windows-scoped options

-- colors
cmd("colorscheme tokyonight")
set.termguicolors = true

set.lazyredraw = true

-- mode lines
set.modeline = true
set.modelines = 5

-- syntax
set.syntax = on 

-- sign column
set.signcolumn = "yes"

-- disable pandoc conceal syntax
g['pandoc#syntax#conceal#use'] = false 

-- tabulations
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2
set.expandtab = true
set.shiftround = true
cmd(
  [[
    autocmd FileType lua setlocal shiftwidth=4 ts=4 sts=4
  ]]
)

-- indentation
set.smartindent =  true
set.autoindent = true

-- text width
set.textwidth = 80
set.colorcolumn = "+0"
cmd("highlight colorcolumn ctermbg=red guibg=red")
set.wrap = false
set.linebreak = true

-- cursor line & column
set.cursorline = true
set.cursorcolumn = true

-- spell check
set.spell = false
cmd(
  [[
    augroup spellSettings
    autocmd FileType pandoc setlocal nospell
    augroup END
  ]]
)

-- encoding
set.encoding = "utf-8"

-- search
set.incsearch =  true
set.hlsearch = true
set.ignorecase = true
set.smartcase = true
set.wrapscan = true

-- dirs
set.backup = true
set.backupdir = fn.stdpath('config') .. '/backup'
set.undofile = true
set.undodir = fn.stdpath('config') .. '/undo'
set.directory = fn.stdpath('config') .. '/swap'

-- clipboard
set.clipboard:append('unnamedplus')

-- mouse
set.mouse:append('a')

-- disable octal numbering
set.nrformats:remove('octals')

-- wildmenu
set.wildmenu = true
set.wildmode = "longest,full"
set.wildignorecase = true
set.wildignore = {'*/cache/*', '*/tmp/*'}
set.showfulltag = true
set.showcmd = true
set.shortmess:append('c')


-- enable numbers
set.number = true
set.relativenumber = true

-- enable folding
set.foldenable = true
set.foldlevel = 0
set.foldlevelstart = 10
-- cmd(
--   [[
--     augroup specialFolds
--     autocmd FileType help      setlocal foldmethod=marker nonumber nolist
--     autocmd FileType vim-plug  setlocal foldmethod=manual nonumber
--     autocmd FileType lua       setlocal foldmethod=syntax
--     autocmd FileType git       setlocal foldmethod=syntax
--     autocmd FileType diff      setlocal foldmethod=syntax
--     autocmd FileType markdown  setlocal foldmethod=syntax wrap linebreak
--     autocmd FileType pandoc    setlocal foldmethod=syntax wrap linebreak
--     augroup END
--   ]]
-- )

-- show matching parenthesis
set.showmatch = true
g.loaded_matchparen = true

-- indent-blankline config
set.list = true
set.listchars = {eol = '↲', tab = '▸ ', trail = '·', space = '⋅'}

-- jinja.vim config
cmd(
    [[
        autocmd! BufRead,BufNewFile *.j2  call jinja#AdjustFiletype()
    ]]
)
