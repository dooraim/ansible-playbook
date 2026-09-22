-- ~/.config/nvim/lua/plugins/flog.lua
-- Grafo dei commit costruito sopra fugitive: <CR>/<Tab> aprono il commit in
-- una side window temporanea, <C-N>/<C-P> scorrono i commit in anteprima.
-- g? dentro il buffer :Flog mostra tutti i mapping.
return {
  "rbong/vim-flog",
  dependencies = { "tpope/vim-fugitive" },
  cmd = { "Flog", "Flogsplit", "Floggit" },
  keys = {
    { "<leader>gg", "<cmd>Flog<cr>", desc = "Flog: Commit graph" },
    { "<leader>gG", "<cmd>vertical Flogsplit<cr>", desc = "Flog: Commit graph (vsplit)" },
  },
  init = function()
    -- Anteprima automatica: spostandosi tra i commit il diff di fianco si
    -- aggiorna da solo. flog#ExecTmp riusa la stessa "temporary side window"
    -- di <CR> (quindi non si accumulano split) e blur=true lascia il cursore
    -- sul grafo. Disattivabile al volo con zp, o con vim.g.flog_auto_preview.
    vim.g.flog_auto_preview = true

    local pending = false

    local function preview()
      pending = false
      if vim.bo.filetype ~= "floggraph" or not vim.g.flog_auto_preview then
        return
      end
      local ok, hash = pcall(vim.fn["flog#Format"], "%h")
      if not ok or hash == nil or hash == "" or hash == vim.b.flog_preview_hash then
        return
      end
      vim.b.flog_preview_hash = hash
      pcall(
        vim.fn["flog#ExecTmp"],
        vim.fn["flog#Format"]("vertical belowright Gsplit %h"),
        { blur = true, static = true }
      )
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("FlogAutoPreview", { clear = true }),
      pattern = "floggraph",
      callback = function(ev)
        vim.api.nvim_create_autocmd("CursorMoved", {
          buffer = ev.buf,
          desc = "Flog: anteprima del commit sotto il cursore",
          callback = function()
            -- debounce: tenendo premuto j non si apre un buffer per riga
            if pending then
              return
            end
            pending = true
            vim.defer_fn(preview, 120)
          end,
        })

        vim.keymap.set("n", "zp", function()
          vim.g.flog_auto_preview = not vim.g.flog_auto_preview
          vim.notify("Flog auto preview: " .. (vim.g.flog_auto_preview and "on" or "off"))
          if vim.g.flog_auto_preview then
            preview()
          end
        end, { buffer = ev.buf, desc = "Flog: toggle anteprima automatica" })
      end,
    })
  end,
}
