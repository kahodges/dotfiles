local function gh(repo)
  return "https://github.com/" .. repo
end

-- [[ Colorscheme ]]

vim.pack.add({ gh("folke/tokyonight.nvim") })
require("tokyonight").setup({
  styles = {
    comments = { italic = false }, -- Disable italics in comments
  },
})

vim.pack.add({ gh("rebelot/kanagawa.nvim") })
require("kanagawa").setup({
  commentStyle = { italic = true },
  transparent = false,
  dimInactive = true,
})

vim.pack.add({ { src = gh("catppuccin/nvim"), name = "catppuccin" } })
require("catppuccin").setup({
  flavour = "frappe",
})

-- Load the colorscheme here
vim.cmd.colorscheme("tokyonight-moon")
-- vim.cmd.colorscheme("kanagawa-wave")
-- vim.cmd.colorscheme("catppuccin")
