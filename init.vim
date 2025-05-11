call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'sainnhe/everforest'

Plug 'nvim-lualine/lualine.nvim'

Plug 'nvim-tree/nvim-web-devicons'

call plug#end()

if has('termguicolors')
    set termguicolors
endif

let g:everforest_background = 'hard'
let g:everforest_transparent_background = '2'

colorscheme everforest

set tabstop=4
set shiftwidth=4 smarttab
set softtabstop=4 
set expandtab 

set clipboard+=unnamedplus

set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

let mapleader = ","
set timeoutlen=2000
let g:netrw_preview = 1
nnoremap <silent> <leader>e :Ex
nnoremap <silent> <leader>t :Tex
nnoremap <silent> <leader>v :Vex
nnoremap <silent> <leader>h :Hex
nnoremap <silent> <leader>l :Lex
nnoremap <silent> <leader>s :Sex

nnoremap <silent> <esc> :noh<cr><esc>

lua << EOF
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#6F8E4F', bold = false })
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#88A35E', bold = false })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#6F8E4F', bold = false })

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c" },
  highlight = { enable = true },
  indent = { enable = true }
}

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'everforest',
    component_separators = { left = '\\', right = '/'},
    section_separators = { left = '\\', right = '/'},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
EOF
