require('go').setup({
  lsp_cfg = {
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
      init_options = {
        usePlaceholders = true,
      }
    }
  },
   lsp_inlay_hints = {
     enable = false
   }
})
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
