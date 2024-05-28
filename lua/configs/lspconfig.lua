-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

lspconfig.ruff_lsp.setup(
  {
    on_attach = on_attach,
    capabilities = capabilities,
  }
)

lspconfig.pyright.setup(
  {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      pyright = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          -- Ignore all files for analysis to exclusively use Ruff
          ignore = { "*" },
        }
      }
    }
  }
)
