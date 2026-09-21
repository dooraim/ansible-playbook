-- ~/.config/nvim/lua/plugins/gitsigns.lua
-- Gitsigns arriva di default da LazyVim (lazyvim.plugins.editor), quindi non
-- basta cancellare questo file: va disabilitato esplicitamente.
-- Tutto il lavoro su Git passa da vim-fugitive (vedi fugitive.lua).
return {
  { "lewis6991/gitsigns.nvim", enabled = false },
}
