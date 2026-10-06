---@type vim.lsp.Config
return {
  cmd = { 'tsc', '--lsp', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
  },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, {
      'tsconfig.json',
      'package.json',
      '.git',
    })
    on_dir(root or vim.fn.getcwd())
  end,
}
