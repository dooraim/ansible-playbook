return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "float",
    float_opts = {
      border = "curved",
    },
  },
  keys = {
    {
      "<leader>gt",
      "<cmd>ToggleTerm direction=float<CR>",
      desc = "Toggle Terminal (forgit)",
      mode = { "n", "t" },
    },
  },
}
