local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end

  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.setup = function()
  require "nvchad.lsp"
  dofile(vim.g.base46_cache .. "lsp")
  local util = require "lspconfig/util"
  local lsp_config = require("lspconfig")

  lsp_config.lua_ls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
            [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }

  -- Generic LSPs to setup
  local servers = { "tsserver", "tailwindcss", "eslint", "cssls" }

  for _, lsp in ipairs(servers) do
    lsp_config[lsp].setup {
      on_attach = M.on_attach,
      capabilities = M.capabilities
    }
  end

  lsp_config.rust_analyzer.setup({
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    filetypes = { "rust" },
    root_dir = util.root_pattern("Cargo.toml"),
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true
        }
      }
    }
  })
end


return M
