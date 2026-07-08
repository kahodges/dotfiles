-- VIM Leader Key (space)
vim.g.mapleader = " "

-- Diagnostic keymap
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Clear highlighs on <Esc>
vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>")

-- nvim package manager
vim.keymap.set(
    "n",
    "<leader><space>p",
    "<cmd>:lua vim.pack.update(nil, { offline = true })<CR>",
    { desc = "[P]ackage manager" }
)

-- Quickfix
vim.keymap.set("n", "<A-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<A-k>", "<cmd>cprev<CR>")

-- Write, Quit, Explore
vim.keymap.set("n", "<leader><leader>e", "<cmd>Ex<CR>", { desc = "Explore" })
vim.keymap.set("n", "<leader><leader>w", "<cmd>w<CR>", { desc = "Write only" })
vim.keymap.set("n", "<leader><leader>l", "<cmd>wq<CR>", { desc = "Write and Quit" })
vim.keymap.set("n", "<leader><leader>q", "<cmd>q!<CR>", { desc = "Quit !" })

-- Buffer Switching
vim.keymap.set("n", "<leader>bp", "<cmd>bprev<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next Buffer" })

-- Lua Specific keymaps
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source Current Lua" })
vim.keymap.set("n", "<leader>x", ":lua<CR>", { desc = "Execute current line - Lua" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Execute current block - Lua" })
