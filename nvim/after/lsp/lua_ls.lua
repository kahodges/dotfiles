local root_markers1 = {
    '.emmyrc.json',
    '.luarc.json',
    '.luarc.jsonc',
}

local root_markers2 = {
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
}
return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { root_markers1, root_markers2, { '.git' }},
    settings = {
        Lua = {
            codeLens = { enable = true },
            hint = { enable = true, semicolon = 'Disable' },
            runtime = {
                version = "LuaJIT",
                path = { "lua/?.lua", "lua/?/init.lua" },
            },
            diagnostics = { globals = { "vim" } },
            format = { enable = false }, -- Disable formatting (formatting is done by stylua)
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    vim.api.nvim_get_runtime_file('lua/lspconfig', false)
                },
            },
        },
    },
}
