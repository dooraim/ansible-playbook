-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

-- Le keymap Git di LazyVim definite in lazyvim/config/keymaps.lua (lazygit,
-- git log, blame, browse) vanno cancellate qui: questo file viene caricato
-- dopo quello di LazyVim. Quelle degli spec dei plugin stanno invece in
-- lua/plugins/lazyvim-git-keys.lua. Sotto <leader>g resta solo fugitive.
-- NB: <leader>gg e <leader>gG NON vanno cancellate qui: le rivendica flog.lua
-- con uno spec `keys`, e LazyVim (safe_keymap_set) rispetta gia' quel claim.
for _, lhs in ipairs({ "<leader>gL", "<leader>gb", "<leader>gf", "<leader>gl" }) do
  pcall(vim.keymap.del, "n", lhs)
end
for _, lhs in ipairs({ "<leader>gB", "<leader>gY" }) do
  pcall(vim.keymap.del, "n", lhs)
  pcall(vim.keymap.del, "x", lhs)
end

-- Etichette dei gruppi: le keymap dei plugin stanno nei rispettivi spec
-- (fugitive.lua per Git, fzf.lua per find/view), cosi' non si sdoppiano.
wk.add({
  { "<leader>g", group = "Git" },
  { "<leader>gh", hidden = true }, -- gruppo "hunks" di gitsigns, ora disabilitato
  { "<leader>v", group = "View" },
})

-- Diff tra due file qualsiasi (Vim nativo, non c'entra Git).
-- <leader>vd lascia la cmdline aperta: scrivi il path e completa con <Tab>.
vim.keymap.set("n", "<leader>vd", ":vert diffsplit ", { desc = "Diff vs file..." })
vim.keymap.set("n", "<leader>vD", "<cmd>diffoff!<cr>", { desc = "Diff off (all windows)" })
