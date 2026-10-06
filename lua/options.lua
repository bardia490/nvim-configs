-- enable faster startup by caching compiled lua modules
vim.loader.enable()

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.guicursor = "n-v-c-sm-i:block"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.o.list = true
vim.opt.completeopt = "menu,menuone,noselect,popup" -- Ensures the menu appears even for a single
                                                    -- match and uses the native popup window.
vim.o.autocomplete = true -- Enables the overall completion feature.

vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.pumheight = 15 -- popup menu height
vim.opt.pumblend = 10 -- popup menu transparency
vim.opt.winblend = 10 -- floating window transparency

-- Enable undo/redo changes even after closing and reopening a file
vim.o.undofile = true

-- lsp configurations
vim.lsp.enable({'zls', 'lua_ls', 'tsc', "gopls"})

vim.cmd.colorscheme "catppuccin"
-- transparent background
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })

Foldmethod = "expr"
Foldexpr = "v:lua.vim.treesitter.foldexpr()"

require('vim._core.ui2').enable({})

-- diagnostic options that make using lsp better
vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = 'rounded',
    source = 'if_many',
  },
  underline = true,
  virtual_text = {
    spacing = 2,
    source = 'if_many',
    prefix = '●',
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN] = 'W',
      [vim.diagnostic.severity.INFO] = 'I',
      [vim.diagnostic.severity.HINT] = 'H',
    },
  },
})

--require('go').setup()

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- nvim-tree-api config
local config = {
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
}
require("nvim-tree").setup(config)
