require 'nvim-web-devicons'.get_icons()

require("lfs")

local function dot_git_exists()
  local path = "./.git"
  if (lfs.attributes(path, "mode") == "directory") then
    return true
  end
  return false
end

if dot_git_exists() then
  branch = '-branch'
else 
  branch = '-📁'
end

local function get_var(my_var_name)
  return vim.api.nvim_get_var(my_var_name)
end

require "staline".setup {
	sections = {
		left = { '  ', 'mode', ' ', 'branch', ' ', 'lsp' },
		mid = { },
                right = {'file_name', 'line_column' }
	},
	mode_colors = {
		i = "#d4be98",
		n = "#84a598",
		c = "#8fbf7f",
		v = "#fc802d",
	},
	defaults = {
		true_colors = true,
		line_column = " [%l/%L] :%c  ",
		branch_symbol = " "
	}
}

-- nvim-tree configurações começa aqui

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- nvim-tree configurações termina aqui

-- nvim-autopairs
require('nvim-autopairs').setup({
  enable_check_bracket_line = false
})

-- bufferline
vim.opt.termguicolors = true
require("bufferline").setup{}
