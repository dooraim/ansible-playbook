-- ~/.config/nvim/lua/plugins/lazyvim-git-keys.lua
-- LazyVim (extra snacks_picker / neo-tree) piazza le sue keymap Git sotto
-- <leader>g tramite gli spec dei plugin: `false` le disattiva senza toccare
-- i plugin stessi. Sotto <leader>g deve restare solo fugitive.
return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>gd", false }, -- Git Diff (hunks)
      { "<leader>gD", false }, -- Git Diff (origin)
      { "<leader>gs", false }, -- Git Status
      { "<leader>gS", false }, -- Git Stash
      { "<leader>gi", false }, -- GitHub Issues (open)
      { "<leader>gI", false }, -- GitHub Issues (all)
      { "<leader>gp", false }, -- GitHub Pull Requests (open)
      { "<leader>gP", false }, -- GitHub Pull Requests (all)
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>ge", false }, -- Git Explorer
    },
  },
}
