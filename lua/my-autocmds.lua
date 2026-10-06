-- autocmds
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    desc = "highligting when yanking",
    callback = function()
        vim.hl.on_yank({ higroup='Visual', timeout=120})
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "ada",
    desc = "make tabstops 6 for ada files",
    callback = function()
        vim.opt.tabstop = 6
        vim.opt.softtabstop = 6
        vim.opt.shiftwidth = 6
end})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    desc = "make tabs look like spaces for readability",
    callback = function()
        vim.opt.listchars = "tab:  "
end})

local function insertHtmlComment()
    -- Translate <Esc> into the actual escape character code
    local keys = vim.api.nvim_replace_termcodes("i<!----><Esc>hhi", true, false, true)
    -- Feed the keys as if the user typed them in Normal mode ("n")
    vim.api.nvim_feedkeys(keys, "n", false)
end

local function insertHtmlBoilerPlateCode()
    local html_boiler_plate = [[
    <!DOCTYPE html>
    <html lang="en">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>My First Web Page</title>
    <script src="main.js" defer></script>
    </head>
    <body>
    <h1>hello, world.</h1>
    </body>
    </html>]]
    -- Translate <Esc> into the actual escape character code
    local keys = vim.api.nvim_replace_termcodes("i"..html_boiler_plate .. "<esc>", true, false, true)
    -- Feed the keys as if the user typed them in Normal mode ("n")
    vim.api.nvim_feedkeys(keys, "n", false)
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "html",
    desc = "inserting comments in html files",
    callback = function(args)
        vim.api.nvim_buf_create_user_command(args.buf, "InsertComment", insertHtmlComment, {})
        vim.api.nvim_buf_create_user_command(args.buf, "InsertHtmlBoilerPlate", insertHtmlBoilerPlateCode, {})
end})

local function insertCssComment()
    -- Translate <Esc> into the actual escape character code
    local keys = vim.api.nvim_replace_termcodes("i/**/<Esc>hi", true, false, true)
    -- Feed the keys as if the user typed them in Normal mode ("n")
    vim.api.nvim_feedkeys(keys, "n", false)
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "css",
    desc = "inserting comments in html files",
    callback = function(args)
        vim.api.nvim_buf_create_user_command(args.buf, "InsertComment", insertCssComment, {})
end})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    desc = "add comments and other stuff",
    callback = function()
        vim.cmd.vnoremap(",/","c//<esc>p")
end})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_completion", { clear = true }),
    callback = function(args)
        local client_id = args.data.client_id
        if not client_id then
            return
        end

        local client = vim.lsp.get_client_by_id(client_id)
        if client and client:supports_method("textDocument/completion") then
            -- Enable native LSP completion for this client + buffer
            vim.lsp.completion.enable(true, client_id, args.buf, {
                autotrigger = true,   -- auto-show menu as you type (recommended)
                -- You can also set { autotrigger = false } and trigger manually with <C-x><C-o>
            })
        end
    end,
})
