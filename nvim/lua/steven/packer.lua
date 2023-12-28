-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        "kyazdani42/nvim-web-devicons"
    }

    use { "tjdevries/express_line.nvim",
        dev = false,
    }

    use "lukas-reineke/indent-blankline.nvim"


    use { "godlygeek/tabular" } -- Quickly align text by pattern

    use { "mkitt/tabline.vim" }

    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {

                signs = {
                    add = { text = "│" },
                    change = { text = "│" },
                    delete = { text = "󰍵" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                    untracked = { text = "│" },
                },
            }
        end
    }

    use { "tpope/vim-repeat" }

    -- use {
    --     "ggandor/leap.nvim",
    --     config = function()
    --         require('leap').create_default_mappings()
    --     end,
    -- }

    use {
        'folke/flash.nvim',
        config = function()
            require("flash").setup{

            }
        end,
    }

    use {
        "luukvbaal/statuscol.nvim",
        config = function()
            require("statuscol").setup {
                setopt = true,
            }
        end,
    }

    use({
        'ramojus/mellifluous.nvim',
        config = function()
            require 'mellifluous'.setup({ --[[...]] }) -- optional, see configuration section.
            vim.cmd('colorscheme mellifluous')
        end,
    })

    -- TODO: Conditionally only do this for linux
    use {
        "yamatsum/nvim-web-nonicons",
        config = function()
            require("nvim-nonicons").setup {}
        end,
    }

    -- use({
    --  'rose-pine/neovim',
    --  as = 'rose-pine',
    --  config = function()
    --   vim.cmd('colorscheme rose-pine')
    --  end
    -- })

    -- use {
    --     "tjdevries/gruvbuddy.nvim", dev = false,
    --     as = 'gruvbuddy'
    -- }

    use {
        "tamago324/lir.nvim",
    }

    use {
        "tamago324/lir-git-status.nvim",
    }

    use {
        "tamago324/lir-mmv.nvim",
        cond = function()
            return vim.fn.executable "mmv" == 1
        end,
    }

    -- use {
    -- "nvim-neo-tree/neo-tree.nvim",
    --   branch = "v3.x",
    --   requires = {
    --     "nvim-lua/plenary.nvim",
    --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    --     "MunifTanjim/nui.nvim",
    --     -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    --   }
    -- }

    use {
        "tjdevries/colorbuddy.nvim"
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use "blazkowolf/gruber-darker.nvim"
    use 'echasnovski/mini.nvim'
    --    use {
    --      "nvim-neo-tree/neo-tree.nvim",
    --        branch = "v3.x",
    --        requires = {
    --          "nvim-lua/plenary.nvim",
    --          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    --          "MunifTanjim/nui.nvim",
    --        },
    --        keys = "<C-b>"
    --      }

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end, }
    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("theprimeagen/refactoring.nvim")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("nvim-treesitter/nvim-treesitter-context");



    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        },
    }

    use("folke/zen-mode.nvim")
    use("github/copilot.vim")
    use("eandrju/cellular-automaton.nvim")
    use("laytan/cloak.nvim")
end)
