-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.opt.relativenumber = true

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- Trim trailing whitespace
    vim.cmd([[%s/\s\+$//e]])

    -- Ensure newline at end of file
    local last_line = vim.fn.getline("$")
    if last_line ~= "" then
      vim.fn.append("$", "")
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.dts", "*.dtsi" },
  callback = function()
    vim.opt_local.expandtab = false -- use tabs instead of spaces
    vim.opt_local.shiftwidth = 4 -- commonly used in kernel-style code
    vim.opt_local.tabstop = 4
  end,
})

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
      },
    },
  },
}
