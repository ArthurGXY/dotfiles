local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
        augroup packer_user_config
                autocmd!
                autocmd BufWritePost setup.lua source <afile> | PackerSync
        augroup end
       ]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
-- My plugins here

-- use 'foo1/bar1.nvim'
-- use 'foo2/bar2.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  use {
          'nvim-lualine/lualine.nvim',
          requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
         'nvim-tree/nvim-tree.lua',
          requires = {
                  'nvim-tree/nvim-web-devicons', -- optional, for file icons
          }
  }

  -- LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  
  use "christoomey/vim-tmux-navigator" -- ctrl + hjkl
  use "nvim-treesitter/nvim-treesitter" -- highlighting
  use "p00f/nvim-ts-rainbow"
  
  -- CMP
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/cmp-path" -- 文件路径

  use "numToStr/Comment.nvim" -- gcc和gc注释
  use "windwp/nvim-autopairs" -- 自动补全括号

  use "akinsho/bufferline.nvim" -- buffer分割线
  use "lewis6991/gitsigns.nvim" -- 左则git提示

  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',  -- 文件检索
    requires = { {'nvim-lua/plenary.nvim'} }
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
        if packer_bootstrap then
                require('packer').sync()
        end
end)
