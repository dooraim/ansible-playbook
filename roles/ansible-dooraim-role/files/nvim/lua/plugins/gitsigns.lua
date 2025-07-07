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

    local wk = require("which-key") -- Ensure which-key is loaded

    wk.register({
      h = {
        name = "Git Hunk", -- This adds a group name for <leader>h
        s = { "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk" },
        r = { "<cmd>Gitsigns reset_hunk<CR>", "Reset Hunk" },
        p = { "<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk" },
        i = { "<cmd>Gitsigns preview_hunk_inline<CR>", "Preview Hunk Inline" },
        b = { "<cmd>Gitsigns blame<CR>", "Blame" },
        l = { "<cmd>Gitsigns blame_line<CR>", "Blame Line" },
      },
    }, { prefix = "<leader>" })
  end,
}
