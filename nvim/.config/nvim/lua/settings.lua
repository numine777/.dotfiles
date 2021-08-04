CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

vim.g.mapleader = " "
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.nu = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir="~/.vim/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff=8
vim.opt.showmode = false
vim.opt.signcolumn="yes"
vim.g.isfname = "+=@-@"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.relativenumber = true

-- Give more space for displaying messages.
vim.opt.cmdheight=2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime=50

-- Don't pass messages to |ins-completion-menu|.
vim.g.shortmess = "+=c"

vim.opt.colorcolumn="99999"

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
vim.g.netrw_localrmdir='rm -rf'

vim.g.colors_name = "gruvbox"
