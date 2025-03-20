call plug#begin()
" List your plugins here
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'sainnhe/everforest'

Plug 'nvim-lualine/lualine.nvim'

Plug 'nvim-tree/nvim-web-devicons'

call plug#end()

if has('termguicolors')
    set termguicolors
endif

let g:everforest_background = 'hard'

colorscheme everforest

lua << EOF
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
