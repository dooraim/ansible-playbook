-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Via SSH non c'e' un display per xclip: il registro + passa per OSC52, cioe'
-- Neovim chiede al terminale locale di copiare il testo negli appunti.
-- Il paste da OSC52 molti terminali non lo supportano (o lo bloccano), quindi
-- "+p incolla semplicemente l'ultimo yank di Neovim.
if vim.env.SSH_TTY then
  local osc52 = require("vim.ui.clipboard.osc52")
  local function paste()
    return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
  end
  vim.g.clipboard = {
    name = "OSC 52",
    copy = { ["+"] = osc52.copy("+"), ["*"] = osc52.copy("*") },
    paste = { ["+"] = paste, ["*"] = paste },
  }
end
