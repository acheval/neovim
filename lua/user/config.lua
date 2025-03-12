-------------------------------------------------------------------------------
-- tips from
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
--
--
-------------------------------------------------------------------------------

local exec = vim.api.nvim_exec -- execute Vimscript
local set = vim.opt -- global options
local cmd = vim.cmd -- execute Vim commands
local api = vim.api -- api calls
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local b = vim.bo -- buffer-scoped options
local w = vim.wo -- windows-scoped options

-- colors
set.termguicolors = true

set.lazyredraw = true

-- mode lines
set.modeline = true
set.modelines = 5

-- syntax
set.syntax = on 

-- sign column
set.signcolumn = "yes"

-- enable xml syntax folding
g['xml_syntax_folding'] = true

-- tabulations
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2
set.softtabstop = 2
set.expandtab = true
set.shiftround = true
api.nvim_create_augroup("specialTabs", {})
api.nvim_create_autocmd({
  "FileType"
}, {
    group = "specialTabs",
    pattern = {
      "lua",
      "*.lua"
    },
    command = "setlocal shiftwidth=4 ts=4 sts=4",
    desc = "set tabstop for lua"
})

-- indentation
set.smartindent =  true
set.autoindent = true

-- text width
set.textwidth = 160
set.colorcolumn = "+0"
cmd("highlight colorcolumn ctermbg=red guibg=red")
set.wrap = false
set.linebreak = true

-- cursor line & column
set.cursorline = true
set.cursorcolumn = true

-- spell check
api.nvim_create_augroup("spellSettings", {})
set.spell = false

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

--  filetypes
api.nvim_create_augroup("specialFiletypes", {})
api.nvim_create_autocmd({
  "BufRead",
  "BufNewFile"
}, {
    group = "specialFiletypes",
    pattern = {
      "*.yml",
      "*.yaml"
    },
    command = "set filetype=yaml.ansible",
    desc = "set filetype for ansible files"
})

-- enable numbers
set.number = true
set.relativenumber = true

-- enable folding
set.foldenable = true
set.foldlevel = 0
set.foldlevelstart = 10
api.nvim_create_augroup("specialFolds", {})
api.nvim_create_autocmd({
  "FileType"
}, {
    group = "specialFolds",
    pattern = {
      "git",
      "lua",
      "diff",
      "markdown"
    },
    command = "setlocal foldmethod=syntax wrap linebreak",
    desc = "set foldmethod syntax"
})

api.nvim_create_autocmd({
  "FileType"
}, {
    group = "specialFolds",
    pattern = {
      "yaml.ansible"
    },
    command = "setlocal foldmethod=indent wrap linebreak",
    desc = "set foldmethod indent"
})

-- show matching parenthesis
set.showmatch = true
g.loaded_matchparen = true

-- indent-blankline config
set.list = true
-- set.listchars = {
--   eol = '↲',
--   tab = '▸ ',
--   trail = '·',
--   space = '⋅'
-- }

