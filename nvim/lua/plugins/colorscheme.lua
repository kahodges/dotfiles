local function gh(repo)
  return "https://github.com/" .. repo
end

-- [[ Colorscheme ]]

-- vim.pack.add({ gh("folke/tokyonight.nvim") })
-- require("tokyonight").setup({
--   styles = {
--     comments = { italic = false }, -- Disable italics in comments
--   },
-- })

-- vim.pack.add({ gh("rebelot/kanagawa.nvim") })
-- require("kanagawa").setup({
--   commentStyle = { italic = true },
--   transparent = false,
--   dimInactive = true,
-- })

vim.pack.add({ gh "catppuccin/nvim" })
local catppuccin = require("catppuccin")
catppuccin.setup({
  flavour = "auto",
  background = {
    light = "latte",
    dark = "mocha",
  },
})

-- Load the colorscheme here
-- vim.cmd.colorscheme("tokyonight-moon")
-- vim.cmd.colorscheme("kanagawa-wave")
vim.cmd.colorscheme("catppuccin")
