----------------------
-- Language options --
----------------------

vim.api.nvim_exec('language en_US.utf8', true)

----------------------------------
-- Required plugins and configs --
----------------------------------

-- user scripts

require('scripts.reload')

require('scripts.nvim_tree_open')

-- user plugins 

require('user.plugins')

require('user.plugins_config')

require('user.coc_config')

-- user config
 
require('user.config')

require('user.mappings')
