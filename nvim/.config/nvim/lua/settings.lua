CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

vim.g.mapleader = " "
vim.g.guicursor = nil
vim.opt.relativenumber = true
vim.g.nohlsearch = true
vim.g.hidden = true
vim.g.noerrorbells = true
vim.g.tabstop=4
vim.g.softtabstop=4
vim.g.shiftwidth=4
vim.g.expandtab = true
vim.g.smartindent = true
vim.g.nu = true
vim.g.nowrap = true
vim.g.noswapfile = true
vim.g.nobackup = true
vim.g.undodir="~/.vim/undodir"
vim.g.undofile = true
vim.g.incsearch = true
vim.g.termguicolors = true
vim.g.scrolloff=8
vim.g.noshowmode = true
vim.g.signcolumn="yes"
vim.g.isfname = "+=@-@"

-- Give more space for displaying messages.
vim.g.cmdheight=2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.g.updatetime=50

-- Don't pass messages to |ins-completion-menu|.
vim.g.shortmess = "+=c"

vim.g.colorcolumn=80

-- vim.g.wildmode = "longest,list,full"
-- vim.g.wildmenu = true
-- vim.g.wildignore"+=*.pyc"
-- vim.g.wildignore"+=*_build/*"
-- vim.g.wildignore"+=**/coverage/*"
-- vim.g.wildignore"+=**/node_modules/*"
-- vim.g.wildignore"+=**/android/*"
-- vim.g.wildignore"+=**/ios/*"
-- vim.g.wildignore"+=**/.git/*"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_localrmdir='rm -r'

vim.g.colors_name = "gruvbox"
