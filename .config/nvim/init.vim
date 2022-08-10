source $HOME/dotfiles/.config/nvim/go.vim
" source $HOME/dotfiles/.config/nvim/markdown.vim
" source $HOME/dotfiles/.config/nvim/unicode.vim
let mapleader = " "

filetype on
filetype indent on
filetype plugin on

set encoding=UTF-8

syntax on
set nocompatible
set hlsearch
set number relativenumber
set laststatus=2
set vb
set ruler
set spelllang=en_us
set autoindent
set colorcolumn=80
set mouse=a
set clipboard=unnamed
set noscrollbind
set wildmenu
set autochdir

hi Search cterm=NONE ctermfg=black ctermbg=red

" No more Arrow Keys, deal with it
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <j>

" netrw

nnoremap - :Explore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
autocmd FileType netrw setl bufhidden=delete

"-- netrw END

" plug 
call plug#begin()
"> Must Have
Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
Plug 'ctrlpvim/ctrlp.vim'      " https://github.com/ctrlpvim/ctrlp.vim
Plug 'ryanoasis/vim-devicons'  " https://github.com/ryanoasis/vim-devicons + https://github.com/ryanoasis/nerd-fonts/
Plug 'tpope/vim-commentary'    " https://github.com/tpope/vim-commentary
Plug 'airblade/vim-gitgutter'  " https://github.com/airblade/vim-gitgutter
Plug 'mkitt/tabline.vim'       " https://github.com/mkitt/tabline.vim
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal

" PSQL Pluging needs :SQLSetType pgsql.vi://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim 
Plug 'https://github.com/lifepillar/pgsql.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " markdown-preview plugin

" NerdTree >  NerdTre://github.com/preservim/nerdtree' 
Plug 'https://github.com/preservim/nerdtree'

"> github copilot 
Plug 'https://github.com/github/copilot.vim'

Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
"> Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " https://github.com/fatih/vim-go
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " https://github.com/neoclide/coc.nvim
Plug 'SirVer/ultisnips'                             " https://github.com/sirver/UltiSnips

"> Theme
Plug 'NLKNguyen/papercolor-theme' " https://github.com/NLKNguyen/papercolor-theme
"> telescope is for fuzzy finder 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" generates tests from the source code 
Plug 'buoto/gotests-vim' "https://github.com/buoto/gotests-vim

call plug#end()

"-- plug END

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" vim-gitgutter

set updatetime=500

"-- vim-gitgutter END

" papercolor-theme

set termguicolors
set background=dark
" colorscheme PaperColor

"-- papercolor-theme END

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"


inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Find files using Telescope command-line sugar. 
nnoremap <leader>ff <cmd>Telescope find_files<cr> 
nnoremap <leader>fg <cmd>Telescope live_grep<cr> 
nnoremap <leader>fb <cmd>Telescope buffers<cr> 
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
