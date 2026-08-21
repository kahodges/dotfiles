local function gh(repo) return "https://github.com/" .. repo end

vim.pack.add({ gh('folke/snacks.nvim') })

local Snacks = require('snacks')

Snacks.setup({
  animate = { enabled = true },
  bigfile = { enabled = true },
  dashboard = { enabled = false },
  dim = { enabled = true },
  explorer = { enabled = false },
  image = {
    enabled = true,
    doc = {
      enabled = true,
      inline = true,
      float = true,
      max_width = 80,
      max_height = 40,
      conceal = function (lang, type)
        return type == "math"
      end,
    },
  },
  indent = { enabled = false },
  input = { enabled = true },
  layout = { enabled = true },
  lazygit = { enabled = true },
  notifier = { enabled = true, timeout = 3000, },
  quickfile = { enabled = false },
  scope = { enabled = false },
  scratch = { enabled = false },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  terminal = { enabled = false },
  toggle = { enabled = true },
  words = { enabled = true },
  zen = { enabled = true },

  picker = { enabled = true },
})

local keymaps = {
  -- Snacks.image
  { "<leader>ih", function() Snacks.image.hover() end, desc = "[I]mage [H]over" },
  -- Snacks.zen
  { "<leader>Z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
  { "<leader>z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
  -- Snacks.picker
  -- -- search
  { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
  { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
  { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
  { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
  { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
  { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
  { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
  -- { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
  -- Snacks.lazygit
  { "<leader>gg", function() Snacks.lazygit.open() end, desc = "Lazygit" }
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
