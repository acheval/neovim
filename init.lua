----------------------
-- Language options --
----------------------

vim.api.nvim_exec('language en_US.utf8', true)

----------------------------------
-- Required plugins and configs --
----------------------------------

-- user config
 
require('user')

-- user scripts

require('functions')

-- base config

require('config')
