local function gh(repo)
  return "https://github.com/" .. repo
end

-- [[ Fuzzy Finder (files, lsp, etc) ]]

---@type (string|vim.pack.Spec)[]
local telescope_plugins = {
  gh("nvim-lua/plenary.nvim"),
  gh("nvim-telescope/telescope.nvim"),
  gh("nvim-telescope/telescope-ui-select.nvim"),
  gh("nvim-telescope/telescope-file-browser.nvim"),
  gh("ErickKramer/nvim-ros2"),
}
if vim.fn.executable("make") == 1 then
  table.insert(telescope_plugins, gh("nvim-telescope/telescope-fzf-native.nvim"))
end

-- NOTE: you can install multiple plugins at once
vim.pack.add(telescope_plugins)
-- ================================================================================================

-- ================================================================================================
-- See ':h telescope' and ':h telescope.setup()'
local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
  -- you can put default mappings / updates / etc. in here
  --  All the info you're looking for is in ':h telescope.setup()'

  -- defaults = {
  --     mappings = {
  --         i = { ['<c-enter>'] = 'to_fuzzy_refine' },
  --     },
  -- },
  pickers = {
    find_files = { theme = "ivy" },
  },
  extensions = {
    ["ui-select"] = { require("telescope.themes").get_dropdown },
    file_browser = { theme = "dropdown", hijack_netrw = true },
  },
})
-- ================================================================================================

-- ================================================================================================
-- nvim-ros2 setup
local ros2 = require("nvim-ros2")

ros2.setup({
  picker = "telescope",
  autocmds = true,
  treesitter = false,
  tuner = true,
  tuner_match_mode = "smart",
  tuner_open_mode = "hide",
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "ROS_CALL_*",
  callback = function(args)
    local bufnr = args.buf
    local map_opts = { buffer = bufnr, slient = true }

    -- Execute the payload
    vim.keymap.set("n", "<CR>", "<cmd>RosRpc send<CR>", vim.tbl_extend("force", map_opts, { desc = "Send RPC Call" }))
    -- Gracefully cancel
    vim.keymap.set("n", "s", "<cmd>RosRpc stop<CR>", vim.tbl_extend("force", map_opts, { desc = "Stop RPC Call" }))
    -- Save with metadata
    vim.keymap.set(
      "n",
      "<leader>s",
      "<cmd>RosRpc save<CR>",
      vim.tbl_extend("force", map_opts, { desc = "Save Payload" })
    )
    -- Smart Load compatible payloads
    vim.keymap.set("n", "<leader>l", function()
      require("nvim-ros2.pickers").saved_payloads()
    end, vim.tbl_extend("force", map_opts, { desc = "Load Payload" }))
    -- Quick exit
    vim.keymap.set("n", "q", "<cmd>q<CR>", vim.tbl_extend("force", map_opts, { desc = "Close RPC Buffer" }))
  end,
})
-- ================================================================================================

-- ================================================================================================
-- Enable Telescope extensions if they are installed
pcall(telescope.load_extension, "fzf")
pcall(telescope.load_extension, "ui-select")
pcall(telescope.load_extension, "nvim-ros2")
-- ================================================================================================

-- ================================================================================================
-- see ':h telescope.builtin'
-- keymaps
local map = function(keys, func, desc, mode)
  mode = mode or "n"
  vim.keymap.set(mode, keys, func, { desc = desc })
end

map("<space>ff", builtin.find_files, "[F]ind [F]iles")
map("<leader>fb", builtin.buffers, "[F]ind [B]uffers")
map("<leader>fh", builtin.help_tags, "[F]ind [H]elp tags")
map("<leader>fe", function()
  require("telescope").extensions.file_browser.file_browser()
end, "[F]ind [E]xplorer")
map("<leader>fn", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, "[F]ind [N]eovim configs")
require("config.telescope.multigrep").setup() -- Custom Multi Grep
-- ================================================================================================

-- ================================================================================================
-- nvim-ros2 keymaps
-- Base Pickers
map("<leader>li", function()
  ros2.pickers.interfaces()
end, "[ROS2]: List interfaces")
map("<leader>ln", function()
  ros2.pickers.nodes()
end, "[ROS2]: List nodes")
map("<leader>la", function()
  ros2.pickers.actions()
end, "[ROS2]: List actions")
map("<leader>lt", function()
  ros2.pickers.topics_info()
end, "[ROS2]: List topics with info")
map("<leader>le", function()
  ros2.pickers.topics_echo()
end, "[ROS2]: List topics with echo")
map("<leader>ls", function()
  ros2.pickers.services()
end, "[ROS2]: List services")

-- Workspace Navigator
map("<leader>fp", function()
  ros2.pickers.packages()
end, "[F]ind ROS2 [P]ackages")
map("<leader>pf", function()
  ros2.pickers.find_files_package()
end, "[P]ackage [F]ind")
map("<leader>pg", function()
  ros2.pickers.grep_package()
end, "[P]ackage [G]rep")
map("<leader>pc", function()
  ros2.pickers.edit_cmake()
end, "[P]ackage [C]Make edit")
map("<leader>pp", function()
  ros2.pickers.edit_package_xml()
end, "[P]ackage [P] xml edit")

-- Snipers
map("<leader>pm", function()
  ros2.pickers.sniper("msg")
end, "Sniper: msg/")
map("<leader>ps", function()
  ros2.pickers.sniper("srv")
end, "Sniper: srv/")
map("<leader>pa", function()
  ros2.pickers.sniper("action")
end, "Sniper: action/")
map("<leader>pi", function()
  ros2.pickers.sniper("include")
end, "Sniper: include/")

-- Tuner
map("<leader>rt", "<cmd>RosTune<CR>", "Start ROS Tuner")
map("<leader>rs", "<cmd>RosTune resync<CR>", "Start ROS Tuner")
map("<leader>rp", "<cmd>RosTune resync --pull<CR>", "Start ROS Tuner")
-- ================================================================================================
