local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.diagnostic.config({ signs = false })

-- Show all diagnostics on current line in floating window
vim.api.nvim_set_keymap(
  'n', '<Leader>d', ':lua vim.diagnostic.open_float()<CR>',
  { noremap = true, silent = true }
)

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- require('completion').on_attach()
end

-- gopls configured in go.lua because life's too short
local servers = {'zls'}
for _, lsp in ipairs(servers) do
    vim.lsp.config(lsp, {
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

-- Typescript
vim.lsp.config('tsserver', {
    capabilities = capabilities,
    on_attach = on_attach,
    cmd = {'typescript-language-server', '--stdio'},
    filetypes = {'typescript', 'typescriptreact', 'javascript', 'javascriptreact'},
    root_markers = {'package.json', 'tsconfig.json', '.git'},
})

vim.lsp.enable('tsserver')
