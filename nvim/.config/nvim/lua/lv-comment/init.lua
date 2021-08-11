require('nvim_comment').setup()

vim.cmd 'nnoremap <leader>/ :CommentToggle<CR>'
vim.cmd 'vnoremap <leader>/ :CommentToggle<CR>'
