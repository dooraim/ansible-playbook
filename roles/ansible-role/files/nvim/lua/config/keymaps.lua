-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader><space>', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>/', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>,', telescope.buffers, { desc = 'Telescope buffers' })

wk.register({
  f = {
    name = "+find",
    ["<space>"] = { telescope.find_files, "Find Files" },
    ["/"]       = { telescope.live_grep,  "Live Grep" },
    [","]       = { telescope.buffers,  "Buffers" },
    f           = { telescope.find_files, "Find Files" },
    g           = { telescope.live_grep,  "Live Grep" },
    b           = { telescope.buffers,    "Buffers" },
    h           = { telescope.help_tags,  "Help Tags" },
  },
  g = {
    name = "Git",
    b = { "<cmd>GitBlameToggle<CR>", "Toggle Blame" },
    l = { "<cmd>GitBlameCopySHA<CR>", "Copy Commit SHA" },
    o = { "<cmd>GitBlameOpenCommitURL<CR>", "Open Commit in Browser" },
    f = { "<cmd>GitBlameOpenFileURL<CR>", "Open File URL in Browser" },
    s = { "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk" },
    r = { "<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk" },
    p = { "<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk" },
    i = { "<cmd>Gitsigns preview_hunk_inline<CR>", "Preview Hunk Inline" },
  },
}, { prefix = "<leader>" })

