local function gh(repo)
  return "https://github.com/" .. repo
end

-- ========================================================================================
--
-- ========================================================================================
-- [[ nvim-tree (sidebar file explorer) ]]
local nvim_tree = {
  gh("nvim-tree/nvim-tree.lua"),
  gh("nvim-lua/plenary.nvim"),
  gh("nvim-tree/nvim-web-devicons"),
}
vim.pack.add(nvim_tree)
-- ========================================================================================

-- ========================================================================================
-- [[ local functions ]]
local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  api.map.on_attach.default(bufnr)

  local opts = function(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local edit_or_open = function()
    local node = api.tree.get_node_under_cursor()

    if node.nodes ~= nil then
      -- expand or collapse folder
      api.node.open.edit()
    else
      -- open file
      api.node.open.edit()
      -- close the tree if file was opened
      api.tree.close()
    end
  end

  -- open as vsplit on current node
  local vsplit_preview = function()
    local node = api.tree.get_node_under_cursor()

    if node.nodes ~= nil then
      --expand or collapse folder
      api.node.open.edit()
    else
      -- open file as vsplit
      api.node.open.vertical()
    end

    -- Finally refocus on tree if it was lost
    api.tree.focus()
  end
  -- ========================================================================================
  -- [[ keymaps ]]
  -- global
  vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<CR>", { silent = true, noremap = true })

  -- on_attach
  vim.keymap.set("n", "l", edit_or_open, opts("Edit or Open"))
  vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
  vim.keymap.set("n", "h", api.tree.close, opts("Close"))
  vim.keymap.set("n", "C", api.tree.collapse_all, opts("Collapse All"))
end
-- ========================================================================================
--
-- ========================================================================================
-- [[ configs ]]
require("nvim-tree").setup({
  on_attach = my_on_attach,
})
