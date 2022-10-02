:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set smarttab
:set clipboard=unnamed
:set encoding=UTF-8
:set nuw=6
:set cursorline
:set showmode

language en_US

call plug#begin()
Plug 'preservim/nerdcommenter'								"Nerdcommenter
Plug 'scrooloose/nerdtree'									"Nerdtree
Plug 'majutsushi/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lambdalisue/battery.vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'keith/swift.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }	"Telecope
Plug 'neoclide/coc.nvim', {'branch': 'release'}				"COC
Plug 'tpope/vim-fugitive'									"Git
Plug 'airblade/vim-gitgutter'
Plug 'cloudhead/neovim-fuzzy'								"Fuzzy search
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/async.vim'
Plug 'mattn/vim-lsp-icons'
Plug 'morhetz/gruvbox'
call plug#end()

" SourceKit-LSP configuration
if executable('sourcekit-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['sourcekit-lsp']},
        \ 'whitelist': ['swift'],
        \ })
endif

let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

" let g:catppuccin_flavour = "mocha" " latte, frappe, macchiato, mocha

" lua << EOF
" require("catppuccin").setup()
" EOF

let $NVIM_TUI_ENABLE_TRUE_COLOR=1 "Setup colors

colorscheme gruvbox

autocmd FileType swift setlocal omnifunc=lsp#complete

nnoremap <SPACE> <Nop>
let mapleader=" "

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

autocmd! BufWritePost {init.vim} source %
nnoremap <leader>f :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>fs :update<cr>
nnoremap <leader>xx :q<cr>
nnoremap <leader>0 :NERDTreeToggle<cr>

