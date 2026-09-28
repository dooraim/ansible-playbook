-- ~/.config/nvim/lua/plugins/lazygit.lua
-- lazygit in una finestra flottante. Keymap sotto <leader>g in minuscolo, come
-- flog e diffview: le maiuscole restano a fugitive. <leader>gl prende il posto
-- del "Git Log" di LazyVim, che rispetta il claim di questo spec `keys`.
-- Non <leader>lg: <leader>l da solo apre Lazy e resterebbe in attesa.
return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- per il bordo della finestra flottante
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
}
