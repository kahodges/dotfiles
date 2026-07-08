local function gh(repo)
  return "https://github.com/" .. repo
end

-- [[ NVIM Ufo Folding plugin ]]
vim.pack.add({ gh('kevinhwang91/nvim-ufo') })
vim.pack.add({ gh('kevinhwang91/promise-async') })

-- Useful options for folding
-- use Neovim nightly branch
vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldinner: ,foldclose:'
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 90
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Option 2: nvim lsp as LSP client
-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities
        -- you can add other fields for setting up lsp server in this table
    })
end
require('ufo').setup()

-- require('ufo').setup({
--   provider_selector = function (bufnr, filetype, buftype)
--     return {'treesitter', 'indent'}
--   end
-- })
