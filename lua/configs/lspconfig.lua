-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local nvlsp = require "nvchad.configs.lspconfig"

lspconfig.ruff_lsp.setup(
  {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
)

lspconfig.pyright.setup(
  {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
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
    on_init = nvlsp.on_init,
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

lspconfig.terraformls.setup(
  {
    on_init = nvlsp.on_init,
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
  }
)

lspconfig.bashls.setup{
    on_init = nvlsp.on_init,
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
}

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
lspconfig.lua_ls.setup {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  settings = {
    Lua = {}
  }
}
