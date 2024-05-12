local lsp_config = require "plugins.configs.lspconfig"
local format_group = vim.api.nvim_create_augroup("DartFormatAndFix", { clear = true })

return {
  widget_guides = {
    enabled = true
  },
  settings = {
    enable_snippets = true
  },
  decorations = {
    device = true,
    project_config = true,
    app_version = true
  },
  lsp = {
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = format_group,
        buffer = bufnr,
        callback = function()
          -- vim.lsp.buf_request(bufnr, "workspace/executeCommand", "Fix All")

          -- Run LSP formatting
          vim.lsp.buf.format({ async = true })
        end,
      })

      lsp_config.on_attach(client, bufnr)
    end,
    capabilities = lsp_config.capabilities
  }
}
