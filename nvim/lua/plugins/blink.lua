local function gh(repo) return 'https://github.com/' .. repo end

-- [[ Snippet Engine ]]

-- NOTE: You can also specify plugin using a version range for its git tag.
--
-- see ':h vim.version.range()' for more info
vim.pack.add { { src = gh 'L3MON4D3/LuaSnip', version = vim.version.range '2.*' } }
require('luasnip').setup {}

-- 'friendly-snippets' contains a varity of premade snippets.
--  see the README about individual language/framework/plugin snippets:
vim.pack.add { gh 'rafamadriz/friendly-snippets' }
require('luasnip.loaders.from_vscode').lazy_load()

-- [[ Completion Engine ]]
vim.pack.add { { src = gh 'saghen/blink.cmp', version = vim.version.range '1.*' } }
require('blink.cmp').setup {
  keymap = { preset = 'super-tab', },
  appearance = { nerd_font_variant = 'mono' },
  completion = {
    documentation = { auto_show = false }
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  snippets = { preset = 'luasnip' },
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  signature = { enabled = true },
}
