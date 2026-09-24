-- ~/.config/nvim/lua/plugins/fugitive.lua
-- Le keymap di fugitive stanno sulle MAIUSCOLE sotto <leader>g, per non
-- scontrarsi con quelle degli
-- extra di LazyVim (che occupano gia' <leader>gS, <leader>gD, <leader>gP...).
return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G", "Gread", "Gwrite", "Gedit", "Gdiffsplit", "Gvdiffsplit", "Gclog" },
  keys = {
    { "<leader>gF", "<cmd>Git<cr>", desc = "Fugitive: Status" },
    { "<leader>gA", "<cmd>Git add %<cr>", desc = "Fugitive: Stage current file" },
    { "<leader>gW", "<cmd>Gwrite<cr>", desc = "Fugitive: Write & stage file" },
    { "<leader>gR", "<cmd>Gread<cr>", desc = "Fugitive: Restore file from index" },
    { "<leader>gM", "<cmd>Git commit -s -v<cr>", desc = "Fugitive: Commit (signoff, verbose)" },
    { "<leader>gN", "<cmd>Git commit --amend --no-edit -s<cr>", desc = "Fugitive: Amend (no edit, signoff)" },
    { "<leader>gC", "<cmd>Git commit --amend -s -v<cr>", desc = "Fugitive: Amend (signoff, verbose)" },
    { "<leader>gO", "<cmd>Git push<cr>", desc = "Fugitive: Push" },
    { "<leader>gU", "<cmd>Git pull --rebase<cr>", desc = "Fugitive: Pull (rebase)" },
    { "<leader>gV", "<cmd>Gvdiffsplit<cr>", desc = "Fugitive: Vertical diff vs index" },
    { "<leader>gQ", "<cmd>Git difftool<cr>", desc = "Fugitive: Difftool to quickfix" },
    { "<leader>gE", "<cmd>Git blame<cr>", desc = "Fugitive: Blame" },
    { "<leader>gH", "<cmd>0Gclog<cr>", desc = "Fugitive: Current file history" },
    { "<leader>gH", ":Gclog<cr>", mode = "v", desc = "Fugitive: History of selection" },
  },
}
