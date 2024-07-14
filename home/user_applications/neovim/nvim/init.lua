-- {{ General Settings
require('general.setup')
require('general.mapping')
-- End General Settings }}

-- {{ External Plugins Setup
vim.cmd("colorscheme catppuccin")

-- Fuzzy Finder
require('telescope.setup')

-- Nerdtree
require('nvim-tree.setup')

-- LazyGit
require('lazygit.setup')

-- Copilot
require('copilot.setup')

-- Language Server
require('intellisense.setup')

-- Appearance
require('noice.setup')
require('bufferline.setup')
require('lualine.setup')

-- End External Plugins Setup }}

