return {
    'fei6409/log-highlight.nvim',
    config = function()
        require('log-highlight').setup {
       -- The file extensions.
          extension = 'log',
    }
    end,
}
