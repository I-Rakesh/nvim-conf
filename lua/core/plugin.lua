local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    -- Color Scheme's
    { "ellisonleao/gruvbox.nvim", priority = 1000 },
    { "catppuccin/nvim",          name = "catppuccin", priority = 1000 },
    {
        'dracula/vim',
        lazy = false,
    },
    { 'rose-pine/neovim',         name = 'rose-pine' },

    --Treesitter
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/nvim-treesitter-refactor',

    -- Harpoon
    'ThePrimeagen/harpoon',

    --Lsp config
    ------------------
    --Package manager
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
    "neovim/nvim-lspconfig",

    --Auto Complete
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind.nvim',
    'rafamadriz/friendly-snippets',
    'L3MON4D3/LuaSnip',

    --Formating
    {
        'jose-elias-alvarez/null-ls.nvim',
        event = "VeryLazy",
    },
    -------------------

    --Coderunner
    { "CRAG666/code_runner.nvim", config = true },

    --oil.nvim
    'stevearc/oil.nvim',

    -- Repeat (.)
    'tpope/vim-repeat',

    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- nvim-tree
    'nvim-tree/nvim-tree.lua',

    --Cmd autocomplete
    {
        'gelguy/wilder.nvim',
        config = function()
        end,
    },

    -- nvim-tree
    'nvim-tree/nvim-tree.lua',

    --Notification ui
    'rcarriga/nvim-notify',

    --Git Itergration
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',

    --Autopair braces
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },

    --Surround
    'tpope/vim-surround',

    -- tmux navigator
    'christoomey/vim-tmux-navigator',

    --indent lines
    'lukas-reineke/indent-blankline.nvim',

    --Terminal
    'akinsho/toggleterm.nvim',
}
local opts = {}

require("lazy").setup(plugins, opts)
