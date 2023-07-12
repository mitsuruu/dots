-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use 'Mofiqul/dracula.nvim'
	use 'folke/tokyonight.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }
	use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
	use ('nvim-treesitter/playground')
	use ('theprimeagen/harpoon')
	use ('mbbill/undotree')
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}
	use ('rust-lang/rust.vim')
	use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}

	use {
		's1n7ax/nvim-terminal',
		config = function()
			vim.o.hidden = true
			require('nvim-terminal').setup()
		end,
	}

	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
	}

	use ({
		"utilyre/barbecue.nvim",
		tag = "*",
		requires = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		after = "nvim-web-devicons",
		config = function()
			require("barbecue").setup()
		end,
	})
	use 'lewis6991/gitsigns.nvim'
	use 'romgrk/barbar.nvim'
	use({
		"NTBBloodbath/galaxyline.nvim",
		-- your statusline
		config = function()
			require("galaxyline.themes.eviline")
		end,
	})
	use 'andweeb/presence.nvim'
end)
