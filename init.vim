call plug#begin('~/.config/nvim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'fishbullet/deoplete-ruby'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'mattn/emmet-vim'
  Plug 'junegunn/vim-slash'
  Plug 'w0rp/ale'
  Plug 'ngmy/vim-rubocop'
  Plug 'janko-m/vim-test'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'scrooloose/nerdcommenter'
call plug#end()

set background=dark
set termguicolors
syntax enable
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = 0
let g:gruvbox_invert_indent_guides = 1
colorscheme gruvbox

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_theme='gruvbox'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'

let g:deoplete#enable_at_startup = 1
let g:ale_set_highlights = 1
let g:ale_fixers = {
\  'javascript': [
\    'prettier',
\    'eslint',
\  ],
\}
let g:ale_fix_on_save = 0
let g:jsx_ext_required = 0

let mapleader=","

set showcmd        " Show (partial) command in status line.
set showmatch      " Show matching brackets.
set showmode       " Show current mode.
set ruler          " Show the line and column numbers of the cursor.
set number         " Show the line numbers on the left side.
set expandtab      " Insert spaces when TAB is pressed.
set tabstop=2      " Render TABs using this many spaces.
set shiftwidth=2   " Indentation amount for < and > commands.
set list

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

nnoremap <silent> <F3> :nohlsearch<CR><C-l>
nnoremap <leader>b :ls<CR>:buffer<Space>
nnoremap <leader>t :Files<CR>
nnoremap <leader>s :Ag! 
nnoremap <leader>f :Find<CR>
nnoremap <leader>e :Ex<CR>
nnoremap <leader>f :bn<CR>
nnoremap <leader>b :bp<CR>
nnoremap <leader>ff :ALEFix<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
nmap <silent> t<leader>n :TestNearest<CR>
nmap <silent> t<leader>f :TestFile<CR>
nmap <silent> t<leader>s :TestSuite<CR>
nmap <silent> t<leader>l :TestLast<CR>

