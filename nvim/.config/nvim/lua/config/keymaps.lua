-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- find files
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })

-- search file content (live grep)
map("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })