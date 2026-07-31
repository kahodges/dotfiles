local function gh(repo)
  return "https://github.com/" .. repo
end

vim.pack.add({ gh("akinsho/toggleterm.nvim") })

require("toggleterm").setup({
  size = 20 or function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<C-n>]],
  hide_numbers = true,
  direction = 'float',
})

-- keymaps
vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>', { noremap = true, silent = true })
