local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("stevearc/dressing.nvim")

	-- colorschemes
	use("lunarvim/colorschemes")
	use("folke/tokyonight.nvim")
	use("rebelot/kanagawa.nvim")
	use("rose-pine/neovim")

	--cmp plugins
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("folke/trouble.nvim")
	use("kevinhwang91/nvim-bqf") -- TODO: configure this.
	use("j-hui/fidget.nvim")
	use("tami5/lspsaga.nvim")
	use("simrat39/symbols-outline.nvim")
	-- https://github.com/ray-x/navigator.lua -- Did not like
	-- https://github.com/rcarriga/nvim-dap-ui
	-- https://github.com/gabrielpoca/replacer.nvim -- I don't see the need

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("xiyaowong/telescope-emoji.nvim")

	-- TreeSitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- Some Plugins
	use("windwp/nvim-autopairs")

	-- Comments
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	-- Git
	use("lewis6991/gitsigns.nvim")
	use("TimUntersberger/neogit")

	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	use({ "akinsho/bufferline.nvim", requires = { "moll/vim-bbye" } })

	use("akinsho/toggleterm.nvim")
	use("nvim-lualine/lualine.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("goolord/alpha-nvim")
	use("folke/which-key.nvim")
	use("rmagatti/auto-session")
	use("szw/vim-maximizer")
	use("nvim-pack/nvim-spectre")
	use("ggandor/lightspeed.nvim")
	use("caenrique/swap-buffers.nvim")
	use("mrjones2014/smart-splits.nvim")
	use("max397574/better-escape.nvim")
	use("norcalli/nvim-colorizer.lua")
	use("mrjones2014/legendary.nvim")
	use("karb94/neoscroll.nvim")
	use("tpope/vim-surround")
	use("SmiteshP/nvim-gps")
	use("folke/zen-mode.nvim")
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("jamestthompson3/nvim-remote-containers")
	use("dstein64/vim-startuptime")
	use("antoinemadec/FixCursorHold.nvim")
	use("nathom/filetype.nvim")
    	-- use("github/copilot.vim")

    use("RRethy/vim-illuminate")

    use("simrat39/rust-tools.nvim")
    use("rust-lang/rust.vim")
	use("fatih/vim-go")
	use("cespare/vim-toml")
	use("stephpy/vim-yaml")
	use("chriskempson/base16-vim")
	-- use{"theHamsta/nvim-dap-virtual-text", config = function() require("nvim-dap-virtual-text").setup() end}
	-- TODO: Install following plugins
	-- https://github.com/pwntester/octo.nvim
	-- https://github.com/michaelb/sniprun
	-- https://github.com/Pocco81/DAPInstall.nvim (Unmaintained)
	-- use("gelguy/wilder.nvim") --  TODO: flashing bugs in buffer when searching
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
