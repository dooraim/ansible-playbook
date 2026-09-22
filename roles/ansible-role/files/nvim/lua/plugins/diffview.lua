-- ~/.config/nvim/lua/plugins/diffview.lua
-- Convive con fugitive e flog, con ruoli distinti: flog mostra la topologia
-- dei branch, diffview rivede un intero change set con l'albero dei file e il
-- diff che segue il cursore. Keymap sotto <leader>gv per non pestare le
-- maiuscole di fugitive.
return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles", "DiffviewRefresh" },
  opts = {},
  keys = {
    { "<leader>gv", "", desc = "+diffview" },
    { "<leader>gvo", "<cmd>DiffviewOpen<cr>", desc = "Diffview: Open (working tree)" },
    { "<leader>gvc", "<cmd>DiffviewClose<cr>", desc = "Diffview: Close" },
    { "<leader>gvh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview: Repo history" },
    { "<leader>gvf", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: Current file history" },
    { "<leader>gvf", ":DiffviewFileHistory<cr>", mode = "v", desc = "Diffview: History of selection" },
    { "<leader>gvb", "<cmd>DiffviewOpen origin/HEAD...HEAD<cr>", desc = "Diffview: Branch vs origin/HEAD" },
    { "<leader>gvt", "<cmd>DiffviewToggleFiles<cr>", desc = "Diffview: Toggle file panel" },
    { "<leader>gvr", "<cmd>DiffviewRefresh<cr>", desc = "Diffview: Refresh" },
  },
}
