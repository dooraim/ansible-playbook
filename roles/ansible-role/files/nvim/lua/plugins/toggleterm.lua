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
      "<leader>vt",
      "<cmd>ToggleTerm direction=float<CR>",
      desc = "Toggle Terminal",
      mode = { "n", "t" },
    },
  },
}
