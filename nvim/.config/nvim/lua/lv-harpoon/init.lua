require("harpoon").setup()
vim.cmd 'nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>'
vim.cmd 'nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>'

vim.cmd 'nnoremap <C-h> :lua require("harpoon.ui").nav_file(1)<CR>'
vim.cmd 'nnoremap <C-t> :lua require("harpoon.ui").nav_file(2)<CR>'
vim.cmd 'nnoremap <C-n> :lua require("harpoon.ui").nav_file(3)<CR>'
vim.cmd 'nnoremap <C-s> :lua require("harpoon.ui").nav_file(4)<CR>'
vim.cmd 'nnoremap <leader>tu :lua require("harpoon.term").gotoTerminal(1)<CR>'
vim.cmd 'nnoremap <leader>te :lua require("harpoon.term").gotoTerminal(2)<CR>'
vim.cmd 'nnoremap <leader>cu :lua require("harpoon.term").sendCommand(1, 1)<CR>'
vim.cmd 'nnoremap <leader>ce :lua require("harpoon.term").sendCommand(1, 2)<CR>'
