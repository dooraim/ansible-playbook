return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = "preview_scrolling_up",
            ["<C-j>"] = "preview_scrolling_down",
          },
        },
      },
    },
  },
}
