vim.cmd [[ call plug#begin()
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'chipsenkbeil/distant.nvim'
Plug 'andweeb/presence.nvim'
call plug#end()

colorscheme catppuccin-macchiato
]]

require("nvim-tree").setup()
require('lualine').setup()
require("distant"):setup()

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end,
})

vim.cmd("cd ~/Documents/projects")

require("catppuccin").setup({
    integrations = {
        lualine = true,
        nvimtree = true
    }
})


