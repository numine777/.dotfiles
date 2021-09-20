vim.g.leader = "space"

vim.cmd 'nnoremap <silent> Q <nop>'
vim.cmd 'nnoremap <silent> <C-f> :lua require("harpoon.term").sendCommand(1, "tmux-sessionizer\\n"); require("harpoon.term").gotoTerminal(1)<CR>'
vim.cmd 'nnoremap <leader>vwh :h <C-R>=expand("<cword>")<CR><CR>'
vim.cmd 'nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>'
vim.cmd 'nnoremap <leader>u :UndotreeShow<CR>'
vim.cmd 'nnoremap <leader>pv :NvimTreeToggle<CR>'
vim.cmd 'nnoremap <leader>h :wincmd h<CR>'
vim.cmd 'nnoremap <leader>l :wincmd l<CR>'
vim.cmd 'nnoremap <leader>j :wincmd j<CR>'
vim.cmd 'nnoremap <leader>k :wincmd k<CR>'
vim.cmd 'nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>'
vim.cmd 'nnoremap <Leader>+ :vertical resize +5<CR>'
vim.cmd 'nnoremap <Leader>- :vertical resize -5<CR>'
vim.cmd 'nnoremap <Leader>rp :resize 100<CR>'
vim.cmd 'nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\\n", err)<CR>}<CR><esc>kkI<esc>'
vim.cmd 'nnoremap <Leader>cpu a%" PRIu64 "<esc>'
vim.cmd 'nnoremap <leader>s :%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>'
vim.cmd "vnoremap J :m '>+1<CR>gv=gv"
vim.cmd "vnoremap K :m '<-2<CR>gv=gv"

-- greatest remap ever
vim.cmd 'vnoremap <leader>p "_dP'

-- next greatest remap ever : asbjornHaland
vim.cmd 'nnoremap <leader>y "+y'
vim.cmd 'vnoremap <leader>y "+y'
vim.cmd 'nnoremap <leader>Y gg"+yG'

vim.cmd 'nnoremap <leader>d "_d'
vim.cmd 'vnoremap <leader>d "_d'
vim.cmd 'inoremap <C-c> <esc>'

vim.cmd 'nnoremap <C-k> :cnext<CR>zz'
vim.cmd 'nnoremap <C-j> :cprev<CR>zz'
-- vim.cmd 'nnoremap <leader>k :lnext<CR>zz'
-- vim.cmd 'nnoremap <leader>j :lprev<CR>zz'
vim.cmd 'tnoremap <Esc> <C-\\><C-n>'
