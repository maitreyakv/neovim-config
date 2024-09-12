-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local nvlsp = require "nvchad.configs.lspconfig"

lspconfig.ruff_lsp.setup(
  {
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
  }
)

lspconfig.pyright.setup(
  {
    on_attach = nvlsp.on_attach,
    capabilitied = nvlsp.capabilities,
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

lspconfig.rust_analyzer.setup(
  {
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
    settings = {
      ["rust-analyzer"] = {
        workspace = {
          symbol = {
            search = {
              kind = "all_symbols"
            }
          }
        }
      }
    }
  }
)

lspconfig.terraformls.setup{}
