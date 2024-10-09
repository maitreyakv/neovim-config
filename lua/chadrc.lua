-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

-- Run LSP formatting on buffer write
vim.api.nvim_create_augroup("AutoFormatting", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.py", "*.rs", "*.tf", "*.tfvars" },
  group = "AutoFormatting",
  callback = function()
    vim.lsp.buf.format()
    vim.lsp.buf.code_action({
      context = { only = { "source.organizeImports", "source.unusedImports" } },
      apply = true,
    })
    -- code_action is forced async, so we need to wait
    vim.wait(100)
  end
})

vim.opt.colorcolumn = "101"

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M
