require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

require("leap").create_default_mappings()
-- vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
-- vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
