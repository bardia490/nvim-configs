return {
  cmd = { "D:/lsps/lua-lsp/bin/lua-language-server.exe"},
  filetypes = { 'lua' },
  root_markers = {
    '.emmyrc.json',
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
  },
  settings = {
    Lua = {
      codeLens = { enable = true },
      hint = { enable = true, semicolon = 'Disable' },

      diagnostics = { globals = { 'vim' } },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          '${3rd}/luv/library',
        },
      },
      telemetry = { enable = false },
    },
  },
}
