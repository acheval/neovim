----------------------
-- Language options --
----------------------

vim.api.nvim_exec('language en_US', true)

----------------------------------
-- Required plugins and configs --
----------------------------------

require('user.plugins')

require('user.plugins_config')

require('user.config')

require('user.mappings')

require('scripts.reload')

require('user.coc_config')
