local opts = {
    -- whether to highlight the currently hovered symbol
    -- disable if your cpu usage is higher than you want it
    -- or you just hate the highlight
    -- default: true
    highlight_hovered_item = true,

    -- whether to show outline guides
    -- default: true
    show_guides = true,
}

require('symbols-outline').setup(opts)
require'nvim-web-devicons'.get_icons()
local lsp_config = {}
local saga = require 'lspsaga'
saga.init_lsp_saga()

vim.cmd 'nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>'
vim.cmd 'nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>'
vim.cmd 'nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>'
vim.cmd 'nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>'
vim.cmd 'nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>'
vim.cmd 'nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>'
vim.cmd 'nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>'
vim.cmd 'nnoremap <leader>vsd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>'
vim.cmd 'nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>'
-- vim.cmd 'nnoremap <leader>vll :call LspLocationList()<CR>'

vim.cmd 'nnoremap <silent><leader>ca :Lspsaga code_action<CR>'
vim.cmd 'vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>'
vim.cmd 'nnoremap <silent> K <cmd>lua require("lspsaga.hover").render_hover_doc()<CR>'
vim.cmd 'nnoremap <silent><leader>gr <cmd>lua require("lspsaga.rename").rename()<CR>'
vim.cmd 'nnoremap <silent> gd <cmd>lua require"lspsaga.provider".preview_definition()<CR>'
vim.cmd 'nnoremap <silent> gs <cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>'
vim.cmd 'nnoremap <silent> gh :Lspsaga lsp_finder<CR>'
vim.cmd 'nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>'
vim.cmd 'nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>'
vim.cmd 'nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>'
vim.cmd 'nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>'
vim.cmd 'tnoremap <silent> <A-d> <C-\\><C-n>:Lspsaga close_floaterm<CR>'


local function documentHighlight(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
            false
        )
    end
end

function lsp_config.common_on_attach(client, bufnr)
    documentHighlight(client, bufnr)
end

function lsp_config.tsserver_on_attach(client, bufnr)
    lsp_config.common_on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
end

return lsp_config
