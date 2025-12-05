local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('go').setup({
  tag_transform = "camelcase",
  tag_options = 'json=omitempty',
  lsp_cfg = {
    capabilities = capabilities,
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
    enable = false,
    -- style = 'eol',
    -- only_current_line = true,
    -- only_current_line_autocmd = "CursorHold",
    -- show_parameter_hints = true
  },
  lsp_on_attach = function(client, bufnr)
    require('go.lsp').gopls_on_attach(client, bufnr)

    local uri = vim.uri_from_bufnr(bufnr)
    if not uri:match("^file://") then
      vim.lsp.stop_client(client.id)
    end
  end
})

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})
