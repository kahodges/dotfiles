-- Netrw configs
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- COLORS!!!
vim.opt.termguicolors = true

-- Enable faster startup by caching compiled Lua modules
vim.loader.enable()

-- Enable nerd fonts
vim.g.have_nerd_font = true

-- Diagnostic Config
vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },

	-- can switch between these as preference
	virtual_text = true, -- Text shows up at the end of the line
	virtual_lines = false, -- Text shows up underneath the line, with virtual lines

	-- Auto open the float, so you can easily read the errors when jumping with:
	-- '[d' and ']d'
	jump = {
		on_jump = function(_, bufnr)
			vim.diagnostic.open_float({
				bufnr = bufnr,
				scope = "cursor",
				focus = false,
			})
		end,
	},
})

-- Text Highlighting on Yank Autocmd
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end,
})

-- ================================================================================
-- OPTIONS
-- ================================================================================
vim.opt.number = true -- line numbers
vim.opt.relativenumber = true -- relative numbers
vim.opt.cursorline = true -- highlight cursor line
vim.opt.wrap = false -- do not wrap lines by default
vim.opt.signcolumn = "yes" -- keep signcolumn on by default
vim.opt.scrolloff = 24 -- minimal number of screen lines to keep above and below the cursor

vim.opt.tabstop = 4 -- tab width
vim.opt.shiftwidth = 4 -- indent width
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.laststatus = 3 -- status bar is now 3 wide
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show matches as you type

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.updatetime = 250 -- decrease update time
vim.opt.timeoutlen = 300 -- decrease mapped sequence wait time

vim.opt.inccommand = "split" -- creates a split in-command window
vim.undofile = true -- enable persistent undo
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"

vim.opt.splitbelow = true -- split windows below (i.e. help windows)
vim.opt.splitright = true -- new windows split right

vim.opt.confirm = true
