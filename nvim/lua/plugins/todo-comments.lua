local function gh(repo) return 'https://github.com/' .. repo end

-- Highlight 'TODO', 'NOTE' etc in comments
vim.pack.add { gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }
