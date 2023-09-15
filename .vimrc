let mapleader = " "

"""" Basic Behavior
set ruler
set number
set relativenumber
set colorcolumn=80
set visualbell
set scrolloff=13
set encoding=utf-8
set nocompatible " make vim behave more useful
set ttyfast " defaults to true, but just in-case
set mouse=a " make vim respond to mouse
set ttymouse=sgr " improves how the mouse behaves (may need to be diff on diff OS)
set clipboard=unnamed " system clipboard through "* (same caveat as above)

set lazyredraw " update screen only when need to
set showmatch " highlight matching parens etc.

" see ':help backup' for info
set backup
set writebackup

set wildmenu " cmd tab menu of options
set wildmode=full " current preferred mode
" ignore opening these files
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" quick UPPERCASE and lowercase word before (applies to the word you're in if mid-word
inoremap u <Esc>gUiw`]
nnoremap u gUiw`]
inoremap l <Esc>guiw`]
nnoremap l guiw`]

" move vertically by visual line (don't skip wrapped lines)
" reqires restart to start working
nmap j gj
nmap k gk

"""" Key Bindings
nnoremap <Leader>r :set relativenumber!<CR>
nnoremap <Leader>c :set cursorline!<CR>
nnoremap <Leader>C :set cursorcolumn!<CR>
nnoremap <Leader>e :Ex<CR> " file explorer: does not toggle
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>wq :wq<CR>

"" Clipboard fun
inoremap p <Esc>"*Pa    " paste from insert mode
nnoremap <Leader>p "*p    " paste from system clipboard
vnoremap <Leader>y "*y    " yank to system clipboard
vnoremap <Leader>x "*d    " cut to system clipboard

" find primeagen mapping for what <C-d/u> does
" the added zz is to center the view on cursor after it moves
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

""" 
" Alt/Meta handling
"""
" use 'sed -n l' to verify that alt-c is sending '^[c' (escape+c, hence \ec)
" execute "set <M-c>=\ec"
" nnoremap <M-c> :set cursorcolumn!<CR>
"
" alternatively you can enter as below or use <C-V><C-[>
" while in INSERT mode to enter the '^['
nnoremap c :set cursorline!<CR>

" set bindings to move whole lines up and down. 
" See below for more:
" https://vim.fandom.com/wiki/Moving_lines_up_or_down?veaction=edit&section=4
nnoremap j :m .+1<CR>==
nnoremap k :m .-2<CR>==
inoremap j <ESC>:m .+1<CR>==gi
inoremap k <ESC>:m .-2<CR>==gi
vnoremap j :m '>+1<CR>gv=gv
vnoremap k :m '<-2<CR>gv=gv


"""" Vim Appearance
" not a bad idea but vim gets confused with Visual mode sometimes
" nnoremap <Leader>v1 :colorscheme default<CR>
" nnoremap <Leader>v2 :colorscheme elflord<CR>
" nnoremap <Leader>v3 :colorscheme slate<CR>

" other builtin colorschemes here:
" https://github.com/vim/colorschemes/tree/master/legacy_colors
nnoremap v1 :colorscheme torte<CR>
nnoremap v2 :colorscheme elflord<CR>
nnoremap v3 :colorscheme pablo<CR>
nnoremap v4 :colorscheme slate<CR>

syntax on " look @ possible reason to use 'enable' instead of 'on'

filetype on
filetype indent on
filetype plugin on

" set cursorcolumn
set cursorline
set showmode
set showcmd

" makes cursor better sometimes
" TODO: find better versions of these
let &t_SI = "\<Esc>[5 q"
let &t_SR = "\<Esc>[3 q"
let &t_EI = "\<Esc>[1 q"

" TODO: control vim statusbar colors
set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2 " last window will always have status line

"""" Tab settings
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4

set autoindent " copy indent from current line when starting a new line
set smartindent " add indent after {


"""" Search settings
nnoremap <Leader>\ :let @/ = ""<CR> " -clear search- 

set incsearch " search as characters are entered
set hlsearch " highlight matches

set ignorecase " ignore case in search when all lowercase
set smartcase " include case in search when contains uppercase

"""" Miscellaneous settings that might be worth enabling
" use this to ensure that typing line is always legible
" hi CursorLine cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white
" hi CursorColumn cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkblue guifg=white


""""" others




