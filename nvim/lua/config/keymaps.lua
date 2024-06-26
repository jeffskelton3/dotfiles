-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Use jj to exit insert mode
map("i", "jj", "<Esc>")

map("n", "\\", ":vsplit<CR>", { silent = true })
map("n", "-", ":split<CR>", { silent = true })
map("n", "<C-L>", ":TmuxNavigateRight<CR>", { silent = true })
map("n", "<C-H>", ":TmuxNavigateLeft<CR>", { silent = true })
map("n", "<C-K>", ":TmuxNavigateUp<CR>", { silent = true })
map("n", "<C-J>", ":TmuxNavigateDown<CR>", { silent = true })
