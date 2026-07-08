local function gh(repo) return 'https://github.com/' .. repo end

-- [[ mini.nvim ]]
-- A collection of various independant plugins/modules
vim.pack.add { gh 'nvim-mini/mini.nvim' }

if vim.g.have_nerd_font then
  require('mini.icons').setup()
  -- Used for backwards compatibility with plugins that require 'nvim-web-devicons'
  MiniIcons.mock_nvim_web_devicons()
end

-- Better Around/Inside textobjects
--
-- Examples:
--  - va)   - [V]isually select [A]round [)]paren
--  - yiiq  - [Y]ank [I]nside [I]+1 [Q]uote
--  - ci'   - [C]hange [I]nside [']quote
require('mini.ai').setup {
  -- NOTE: Avoid conflicts with the built-in incremental selection mappings on Neovim>=0.12 (see ':h treesitter-incremental-selection')
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
}

-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
--  - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
--  - sd'   - [S]urround [D]elete [']quotes
--  - sr)'  - [S]urround [R]eplace [)] [']

-- Simple and easy statusline
--  You could remove this setup call if you don't like it,
--  and try some other statusline plugin
local statusline = require('mini.statusline')
statusline.setup { use_icons = vim.g.have_nerd_font }

-- You can configure selections in the status line by overriding their
-- default behaviour. For example, here we set the section for
-- cursor location to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function() return '2%l:%-2v' end
