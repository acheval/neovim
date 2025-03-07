----------------------
-- Language options --
----------------------

vim.api.nvim_exec('language en_US.utf8', true)

----------------------------------
-- Required plugins and configs --
----------------------------------

-- user config
 
require('user.config')

require('user.mappings')

-- user scripts

require('functions.reload')

-- base config

require('config.lazy')
