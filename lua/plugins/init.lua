return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Lua
        "lua-language-server",
        -- Python
        "pyright",
        "ruff-lsp",
        -- Rust
        "rust-analyzer"
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/trouble.nvim" },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    ft = { "python" },
    opts = function()
      return require "configs.none-ls"
    end
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "python",
        "sql",
        "rust",
      },
    },
  },

  { "ggandor/leap.nvim" },
}
