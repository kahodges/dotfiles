local function gh(repo) return "https://github.com/" .. repo end

-- [[ Markview ]] --
vim.pack.add { gh 'OXY2DEV/markview.nvim' }

-- Setup
local Markview = require('markview')
Markview.setup({
  preview = {
    enable = false,
    icon_provider = "devicons",
  }
})

-- keymaps
vim.keymap.set('n', '<leader>mt', '<cmd>Markview<CR>', { desc = '[M]arkview [T]oggle'})
