local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup({function(use)
  use 'wbthomason/packer.nvim' -- Packer can manage itself

    -- Vim script plugins

        -- Tim Pope plugins
        use 'tpope/vim-surround'
        use 'tpope/vim-sensible'
        use 'tpope/vim-fugitive'
        use 'tpope/vim-commentary'
        use 'tpope/vim-repeat'

        -- Tabular plugin
        use 'godlygeek/tabular'

        -- Pandoc plugins
        use 'vim-pandoc/vim-pandoc'
        use 'vim-pandoc/vim-pandoc-syntax'

        -- Jinja
        -- use 'Glench/Vim-Jinja2-Syntax'
        use 'HiPhish/jinja.vim'

    -- Lua plugins

        -- Nvim Tree plugins
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
        }

        -- CoC Autocomplete
        use 'neoclide/coc.nvim'

        -- Tree Sitter
        use {
                'nvim-treesitter/nvim-treesitter',
                run = ':TSUpdate'
        }
        use 'nvim-treesitter/nvim-treesitter-context'

        -- Colors Plugins
        use 'folke/tokyonight.nvim'

        -- Status Bar
        use 'nvim-lualine/lualine.nvim'

        -- Git plugins
        use 'lewis6991/gitsigns.nvim'
        -- use 'tveskag/nvim-blame-line'
        use 'akinsho/git-conflict.nvim'

        -- Search plugins
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
                'nvim-treesitter/nvim-treesitter',
                'nvim-tree/nvim-web-devicons'
                -- 'sharkdp/fd', -- External dep required for live-grep 
                -- 'BurntSushi/ripgrep', -- External dep required for live-grep
            }
        }
        use 'yamatsum/nvim-cursorline'

        -- Vim autoclose plugin
        use 'windwp/nvim-autopairs'

        -- YAML
        use {
            'cuducos/yaml.nvim',
            requires = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-telescope/telescope.nvim" -- optional
            },
        }

        -- Which key plugin
        use 'folke/which-key.nvim'

        -- Scrollbar
        use 'petertriho/nvim-scrollbar'

        -- Indentation guide
        use 'lukas-reineke/indent-blankline.nvim'

        -- Workspaces
        use 'natecraddock/workspaces.nvim'
        use 'ahmedkhalf/project.nvim'

        -- Buffer delete
        use 'famiu/bufdelete.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
    display = {
        open_fn = function()
                return require('packer.util').float({ border = 'single' })
        end
        }
}})
