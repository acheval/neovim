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
        use 'tpope/vim-abolish'

        -- Tabular plugin
        use 'godlygeek/tabular'

        -- Pandoc plugins
        use 'vim-pandoc/vim-pandoc'
        use 'vim-pandoc/vim-pandoc-syntax'

        -- Jinja
        -- use 'Glench/Vim-Jinja2-Syntax'
        use 'HiPhish/jinja.vim'

        -- Mini.nvim
        use 'echasnovski/mini.nvim'
        use 'echasnovski/mini.icons'

    -- Lua plugins

        -- Nvim Tree plugins
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
        }

        -- CoC Autocomplete
        use {
          'neoclide/coc.nvim',
          branch = 'release',
          run = ':CocInstall \
                coc-lua \
                coc-json \
                @yaegassy/coc-ansible \
                coc-htmldjango \
                coc-groovy'
        }

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
        -- nvim v0.7.2
        use({
            "kdheepak/lazygit.nvim",
            -- optional for floating window border decoration
            requires = {
                "nvim-lua/plenary.nvim",
            },
        })

        -- Search plugins
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
                'nvim-treesitter/nvim-treesitter',
                'nvim-tree/nvim-web-devicons',
                'fannheyward/telescope-coc.nvim',
                -- 'sharkdp/fd', -- External dep required for live-grep 
                -- 'BurntSushi/ripgrep', -- External dep required for live-grep
            },
            wants = {
                'kkharji/sqlite.lua'
            }
        }
        use 'yamatsum/nvim-cursorline'
        use 'kkharji/sqlite.lua'
        use {
            'nvim-telescope/telescope-frecency.nvim',
            config = function()
                require('telescope').load_extension('frecency')
            end,
            requires = {
              'kkharji/sqlite.lua'
            }
        }

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
