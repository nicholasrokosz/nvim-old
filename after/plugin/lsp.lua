require('neodev').setup({})
local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
})

--lsp.on_attach(function(client, bufnr)
--    local opts = { buffer = bufnr, remap = false }
--    local set = vim.keymap.set
--
--    set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
--    set('n', 'K', function() vim.lsp.buf.hover() end, opts)
--    set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
--    set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
--    set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
--    set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
--    set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
--    set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
--    set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
--    set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
-- end)

lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

lsp.setup()
