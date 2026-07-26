local function gh(repo) return "https://github.com/" .. repo end

vim.pack.add({ gh('folke/snacks.nvim') })

local Snacks = require('snacks')

Snacks.setup({
  animate = { enabled = true },
  bigfile = { enabled = true },
  dashboard = { enabled = false },
  dim = { enabled = true },
  explorer = { enabled = false },
  image = { enabled = false },
  indent = { enabled = false },
  input = { enabled = true },
  layout = { enabled = true },
  lazygit = { enabled = true },
  notifier = { enabled = true, timeout = 3000, },
  quickfile = { enabled = true },
  scope = { enabled = false },
  scratch = { enabled = false },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  terminal = { enabled = false },
  toggle = { enabled = true },
  words = { enabled = true },
  zen = { enabled = true },

  picker = { enabled = false },
})

local keymaps = {
  { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
  { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
  { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
  -- { "<c-\\>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
}

for _, map in ipairs(keymaps) do
  local opts = { desc = map.desc }
  if map.silent ~= nil then
    opts.silent = map.silent
  end
  if map.noremap == map.noremap then
    opts.noremap = map.noremap
  else
    opts.noremap = true
  end
  if map.expr ~= nil then
    opts.expr = map.expr
  end

  local mode = map.mode or "n"
  vim.keymap.set(mode, map[1], map[2], opts)
end
