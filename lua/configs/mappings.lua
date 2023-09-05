-- Sair com 'q' , se usar gravação de macros altere para <C-q> → Ctrl + q
vim.cmd([[ map <C-q> :q<CR> ]])

-- Para Salvar com 'Ctrl + S' nos modos: Normal, Inserção e Visual
-- Precisa adicionar a linha: stty -ixon , ao seu ~/.bashrc
vim.cmd([[ nnoremap <C-s> :w<CR> ]])
vim.cmd([[ inoremap <C-s> <Esc>:w<CR>l ]])
vim.cmd([[ vnoremap <C-s> <Esc>:w<CR> ]])

-- Selecionar tudo com 'Ctrl + A'
vim.cmd([[ map <C-a> ggVG ]])

-- BASH - Auto preenche arquivos .sh que não existirem com a SheBang
vim.cmd([[ autocmd BufNewFile *.sh :call append(0, '#!/usr/bin/env bash') ]])

-- nvim-tree customizados
vim.cmd([[ nnoremap <C-n> :NvimTreeToggle<CR> ]])
vim.cmd([[ inoremap <C-n> <Esc>:NvimTreeToggle<CR>l ]])
vim.cmd([[ vnoremap <C-n> <Esc>:NvimTreeToggle<CR> ]])

-- nvim-tree do repositório
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  on_attach = my_on_attach,
}
-- aqui acaba as configurações do nvim-tree do repositório.

-- vim-move
vim.cmd([[ let g:move_key_modifier = 'C' ]]) -- Use o 'C' porque o 'S' já é do Surround
