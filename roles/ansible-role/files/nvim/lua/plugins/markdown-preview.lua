return {
  'brianhuster/live-preview.nvim',
  dependencies = {
      -- You can choose one of the following pickers
      'nvim-telescope/telescope.nvim',
      'ibhagwan/fzf-lua',
      'echasnovski/mini.pick',
  'folke/snacks.nvim',
  },
  cmd = { "LivePreview" },
  keys = {
    {
      "<leader>vp",
      function()
        if require("livepreview").is_running() then
          vim.cmd("LivePreview close")
        else
          vim.cmd("LivePreview start")
        end
      end,
      desc = "Toggle Markdown Live Preview",
    },
  },
}
