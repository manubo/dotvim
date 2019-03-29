call plug#begin('~/.config/nvim/plugged')
  Plug 'morhetz/gruvbox'
  Plug 'iCyMind/NeoSolarized'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install -g tern' }
  Plug 'fishbullet/deoplete-ruby'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/vim-slash'
  Plug 'w0rp/ale'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'ngmy/vim-rubocop'
  Plug 'janko-m/vim-test'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'kchmck/vim-coffee-script'
  Plug 'mattn/emmet-vim'
  Plug 'tomtom/tcomment_vim'
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/paredit.vim'
  Plug 'SirVer/ultisnips'
  Plug 'elixir-editors/vim-elixir'
  Plug 'reasonml-editor/vim-reason-plus'
  Plug 'JamshedVesuna/vim-markdown-preview'
  Plug 'kana/vim-textobj-user'
  Plug 'rhysd/vim-textobj-ruby'
  Plug 'ap/vim-css-color'
call plug#end()

let g:python3_host_prog = '/usr/local/bin/python3'

set termguicolors
syntax enable

set hidden

" papercolor set background=light
" colorscheme PaperColor

" solarized
" set background=light
" let g:neosolarized_contrast = "normal"
" let g:neosolarized_visibility = "normal"
" let g:neosolarized_vertSplitBgTrans = 1
" let g:neosolarized_bold = 1
" let g:neosolarized_underline = 1
" let g:neosolarized_italic = 0
" colorscheme NeoSolarized

" gruvbox
set background=dark
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = 0
let g:gruvbox_invert_indent_guides = 1
colorscheme gruvbox

let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_theme='papercolor'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:tern#command = ['/usr/local/bin/tern']
let g:deoplete#enable_at_startup = 1
let g:ale_set_highlights = 1
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'ruby': ['rubocop'],
\}
let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'ruby': ['rubocop'],
\}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:jsx_ext_required = 0

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

let vim_markdown_preview_github=1

let mapleader=" "

set showcmd        " Show (partial) command in status line.
set showmatch      " Show matching brackets.
set showmode       " Show current mode.
set ruler          " Show the line and column numbers of the cursor.
set number         " Show the line numbers on the left side.
set expandtab      " Insert spaces when TAB is pressed.
set tabstop=2      " Render TABs using this many spaces.
set shiftwidth=2   " Indentation amount for < and > commands.
set list
set tags=.tags

let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

nnoremap <silent> <F3> :nohlsearch<CR><C-l>
nnoremap <leader>b :ls<CR>:buffer<Space>
nnoremap <leader>t :Files<CR>
nnoremap <leader>g :Ag!
nnoremap <leader>e :Ex<CR>
nnoremap <leader>b :bp<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>af :ALEFix<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>

" close buffer without closing split
nnoremap <silent> <leader>w :lclose<bar>b#<bar>bd #<CR>
nmap <silent> t<leader>n :TestNearest<CR>
nmap <silent> t<leader>f :TestFile<CR>
nmap <silent> t<leader>s :TestSuite<CR>
nmap <silent> t<leader>l :TestLast<CR>
nmap <silent> t<leader>v :TestVisit<CR>
nmap <leader>j <C-P><C-\>w

tnoremap <C-[> <C-\><C-n>

"Switching between split panes
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
