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
	use ("wbthomason/packer.nvim") -- Have packer manage itself	
	use("nvim-lua/plenary.nvim") -- Lua functions that Telescope plugin use
	use("nvim-telescope/telescope.nvim")
	-- Install Which Key
  	use("folke/which-key.nvim")
	use("tanvirtin/monokai.nvim")
	-- Collection of common configurations for the Nvim LSP client
  	use("neovim/nvim-lspconfig")
	-- Autocompletion framework
  	use("hrsh7th/nvim-cmp")
	use("simrat39/rust-tools.nvim")
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	    -- LSP completion source:
	    use 'hrsh7th/cmp-nvim-lsp'

	    -- Useful completion sources:
	    use 'hrsh7th/cmp-nvim-lua'
	    use 'hrsh7th/cmp-nvim-lsp-signature-help'
	    use 'hrsh7th/cmp-vsnip'                             
	    use 'hrsh7th/cmp-path'                              
	    use 'hrsh7th/cmp-buffer'                            
	    use 'hrsh7th/vim-vsnip'        	
	    use { "catppuccin/nvim", as = "catppuccin" }
	    use { 'kartikp10/noctis.nvim', requires = { 'rktjmp/lush.nvim' } }
	    use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
}
	use "sindrets/diffview.nvim"

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
