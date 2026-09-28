-- ~/.config/nvim/lua/plugins/gitsigns.lua
-- Gitsigns arriva di default da LazyVim (lazyvim.plugins.editor).
-- Lo usiamo solo per i segni colorati sulle righe non committate:
-- on_attach vuoto sovrascrive quello di LazyVim, quindi niente keymap
-- <leader>gh... Tutto il lavoro su Git passa da vim-fugitive (vedi fugitive.lua).
return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function() end,
    },
  },
}
