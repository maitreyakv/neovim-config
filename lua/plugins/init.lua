return {
  {
    "neovim/nvim-lspconfig",
    config = function()
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

  { "ggandor/leap.nvim" },
}
