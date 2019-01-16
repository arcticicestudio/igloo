" Copyright (c) 2016-present Arctic Ice Studio <development@arcticicestudio.com>
" Copyright (c) 2016-present Sven Greb <development@svengreb.de>

" Project:    igloo
" Repository: https://github.com/arcticicestudio/igloo
" License:    MIT
" References:
"   https://google.github.io/styleguide/vimscriptguide.xml

"+---------+
"+ Plugins +
"+---------+
call plug#begin(expand('~/.vim/plugged'))
"+--- IDE / Workflow ---+
Plug 'mattn/emmet-vim'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-fugitive'
Plug 'shime/vim-livedown'
if v:version >= 704
  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips'
endif

"+--- UI ---+
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'ap/vim-css-color'
Plug 'airblade/vim-gitgutter'

"+--- Syntax ---+
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

"+--- Color Themes ---+
Plug 'arcticicestudio/nord-vim'
call plug#end()

"+--- Yggdroot/indentLine ---+
let g:indentLine_enabled = 0
let g:indentLine_char = '│'

"+--- itchyny/lightline.vim ---+
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'fugitive', 'filename' ]
      \   ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename'
      \ },
      \ 'separator': {
      \   'left': '',
      \   'right': ''
      \ },
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
    \ }

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

"+--- scrooloose/nerdcommenter ---+
" Add spaces after comment delimiters
let g:NERDSpaceDelims = 1

"+--- airblade/vim-gitgutter ---+
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

"+--- pangloss/vim-javascript ---+
let g:javascript_enable_domhtmlcss = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

"+--- mxw/vim-jsx ---+
let g:jsx_ext_required = 0

"+--- shime/vim-livedown ---+
" Automatically show the preview upon opening Markdown buffer
let g:livedown_autorun = 0
" Open the browser window upon previewing
let g:livedown_open = 1
let g:livedown_port = 1337

"+--- SirVer/ultisnips ---+
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

"+---------------+
"+ Auto Commands +
"+---------------+
" Enable syntax highlight syncing from start
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync fromstart
augroup END

" Exit if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"+--------------+
"+ Key Mappings +
"+--------------+
let mapleader = ","
let g:mapleader = ","

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <C-n> :NERDTreeToggle<CR>

" Moves the current line or selected block(s) up- or down by one line.
"
" In normal -and insert mode the "==" re-indents the moved line to suit its new position.
" In visual mode "gv" reselects the last visual block while the "=" re-indents that block using the
" preassigned "'>" mark to identify the selection end.
" Note that due to a global (non-modifyable) system keymapping on macOS it is necessary to use environment
" specific assignments.

if has("macunix")
  nnoremap <C-S-Down> :m+<CR>==
  nnoremap <C-S-Up> :m-2<CR>==
  inoremap <C-S-Down> <Esc>:m+<CR>==gi
  inoremap <C-S-Up> <Esc>:m-2<CR>==gi
  vnoremap <C-S-Down> :m '>+1<CR>gv=gv
  vnoremap <C-S-Up> :m '<-2<CR>gv=gv
else
  nnoremap <C-Down> :m+<CR>==
  nnoremap <C-Up> :m-2<CR>==
  inoremap <C-Down> <Esc>:m+<CR>==gi
  inoremap <C-Up> <Esc>:m-2<CR>==gi
  vnoremap <C-Down> :m '>+1<CR>gv=gv
  vnoremap <C-Up> :m '<-2<CR>gv=gv
endif

"+---------------+
"+ Configuration +
"+---------------+
syntax enable
colorscheme nord

filetype plugin on
filetype indent on
set pastetoggle=<F3>
set autochdir
set binary
set nobackup
set nocompatible
set noswapfile
set nowb
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set viminfo=
set updatetime=250

if has("gui_running")
  set mouse=a
endif

"+----+
"+ UI +
"+----+
set ffs=unix,dos,mac
set gfn=Source\ Code\ Pro\ Regular\ 12
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
set termguicolors
set hidden
set laststatus=2
set lazyredraw
set noerrorbells
set noshowmode
set novisualbell
set number
set ruler
set t_vb=
set tm=500
set wildmenu
set wildignore=*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

"+--- Editor ---+
set autoindent
set backspace=indent,eol,start
set cursorline
set colorcolumn=160
set expandtab
set foldcolumn=1
set foldenable
set foldlevelstart=10
set guicursor=a:ver25-Cursor/lCursor
set linebreak
set listchars=eol:¬,space:·,tab:»\
set magic
set mat=2
set shiftwidth=2
set showmatch

" Toggle the sign column automatically when there are signs available to display.
set signcolumn=auto
set smartindent
set smarttab
set softtabstop=2
set tabstop=2
set textwidth=160

" Automatically wrap left and right.
" This allows to move the cursor to the previous/next line after reaching first/last character in the line using the arrow keys in normal-, insert- (<,>) and visual mode ([,]) or the h and l keys.
set whichwrap+=<,>,h,l,[,]
set wrap

"+--- Search ---+
set ignorecase
set smartcase
set hlsearch
set incsearch

"+-----------+
"+ Functions +
"+-----------+
" Shows syntax highlighting groups for the current cursor position
nmap <C-S-K> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
