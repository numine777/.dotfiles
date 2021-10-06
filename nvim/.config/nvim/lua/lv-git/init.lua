local Worktree = require("git-worktree")
local Job = require("plenary.job")
local Path = require("plenary.path")
require("telescope").load_extension("git_worktree")

vim.cmd 'nnoremap <leader>ga :Git fetch --all<CR>'
vim.cmd 'nnoremap <leader>grum :Git rebase upstream/master<CR>'
vim.cmd 'nnoremap <leader>grom :Git rebase origin/master<CR>'

vim.cmd 'nmap <leader>gh :diffget //3<CR>'
vim.cmd 'nmap <leader>gu :diffget //2<CR>'
vim.cmd 'nmap <leader>gl :G<CR>'

