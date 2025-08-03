-- return {
--   "lewis6991/gitsigns.nvim",
--   config = function()
--     require("gitsigns").setup()
--     vim.keymap.set("n", "]c", "<cmd>Gitsigns next_hunk<CR>", { desc = "Next Git Hunk" })
--     vim.keymap.set("n", "[c", "<cmd>Gitsigns prev_hunk<CR>", { desc = "Previous Git Hunk" })
--     vim.keymap.set("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
--     vim.keymap.set("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
--     vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" })
--     vim.keymap.set("n", "<leader>hb", "<cmd>Gitsigns blame_line<CR>", { desc = "Blame Line" })
return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      current_line_blame = true, -- Show git blame inline for the current line
    })
  end,
}
