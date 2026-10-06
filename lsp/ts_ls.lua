return {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, { 'tsconfig.json', 'package.json', '.git' })
        if root then
            on_dir(root)
        else
            on_dir(vim.fn.getcwd())
        end
    end,
}
