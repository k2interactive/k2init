let mapleader = " "
let maplocalleader = " "

set nocompatible " make vim behave more useful
let system_name = substitute(system('uname'), '\n', '', '') " for later

" load local .vimrc files
if !exists("*ReloadConfigs")
  function ReloadConfigs()
    :source ~/.vimrc
    if has('gui_running')
      if has('gui_vimr')
        :source ~/.gvimrc
      else
        :source ~/.config/nvim/ginit.vim
      endif
    endif
  endfunction
  command! RC call ReloadConfigs()
endif


"""" MARK Basic Behavior """""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright " splits new window down and to the right
set wildmenu
set wildmode=full " current preferred mode
set showtabline=2
set ruler
set number
set relativenumber
set cursorline
set showmode
set showcmd
set colorcolumn=80
set scrolloff=50 " keeps cursor x number from the egde (or pinned in the center if large enough value)
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
" ignore opening these files
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set hlsearch
set incsearch
set ignorecase " ignore case in search when all lowercase
set smartcase " include case in search when contains uppercase
set cmdheight=1

set mouse=a " make vim respond to mouse in all modes
if !has('nvim')
    set ttymouse=sgr " for alacritty terminfo
endif
set display+=lastline " Show last line in the window rather than '@'
set maxmempattern=2000000 " Avoid E363 (guessing maybe when a recursion and/or mem leak)
set autochdir " For Neovim
set showmatch " highlight matching parens etc.
"" Hidden allows multiple buffers to share the same window and undo
"" See for more info: https://vim.fandom.com/wiki/Example_vimrc 
set hidden

" TODO: these have a complicated interplay
" need to research/experiment more
"" see ':help backup' for info
"set backup
set writebackup


" Time out - Gives you an adjustment on how fast you need to enter sequences and motions respectively. 
set timeout
set ttimeout
set timeoutlen=500
set ttimeoutlen=100

set laststatus=2
set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ hex:\ 0x%B\ %l:\%c\ %p%%

"" netrw config
let g:netrw_winsize=25
let g:netrw_banner=0
let g:netrw_hide=1
let g:netew_liststyle=3

"""" MARK Cursor """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    set guicursor=n-v-c-sm:block-blinkon100,i-ci-ve:ver25-blinkon100,r-cr-o:hor20-blinkon100
else
  if $TERM_PROGRAM ==# 'iTerm.app'
    let &t_SI = "\<Esc>]50;CursorShape=1;BlinkingCursorEnabled=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2;BlinkingCursorEnabled=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0;BlinkingCursorEnabled=1\x7"
    " Init cursor shape/color on startup
    augroup reset_iTerm_cursor_shape
    au!
    autocmd VimEnter * :normal :startinsert :stopinsert
    autocmd VimEnter * redraw!
    augroup END
  else
    let &t_SI = "\e[5 q" " SI = INSERT mode
    let &t_SR = "\e[3 q" " SR = REPLACE mode
    let &t_EI = "\e[1 q" " EI = NORMAL mode (ELSE)
    " Init cursor shape/color on startup
    augroup reset_cursor_shape
    au!
    "autocmd VimEnter * startinset | stopinsert
    autocmd VimEnter * normal! :startinsert :stopinsert
    "autocmd VimEnter * :normal :startinsert :stopinsert
    autocmd VimEnter * redraw!
    augroup END
    " Reset Cursor when vim exits:
    autocmd VimLeave * silent !echo -ne "\e[5 q"
  endif
endif " //End 'Cursor'


"""" MARK Color Scheme """""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_ZH=[3m
set t_ZR=[23m

function! g:SetColorScheme(tname)
  syntax clear
  highlight clear
  set background=dark
  syntax enable
  exe 'colorscheme ' . a:tname
  hi Comment cterm=italic ctermfg=darkgray guifg=#555555
  hi ModeMsg guifg=black ctermfg=black guibg=gray ctermbg=gray
endfunction

if has('gui')
  set termguicolors
  " setup tokyonight setting even though wo're starting with catppuccin
  let g:tokyonight_style = 'night'
  let g:tokyonight_enable_italic=1
  call SetColorScheme("catppuccin_mocha")

  function! g:ToggleScheme()
    if g:colors_name ==# 'catppuccin_mocha'
      call SetColorScheme('tokyonight')
    else
      call SetColorScheme('catppuccin_mocha')
    endif
  endfunction
else
  call SetColorScheme("industry")

  function! g:ToggleScheme()
    if g:colors_name ==# 'industry'
      call SetColorScheme('slate')
    else
      call SetColorScheme('industry')
    endif
  endfunction
endif

"" Finishing touches

" Prevent known issue with wrong background color during rapid scrolling
if (&term =~ '^xterm' && &t_Co == 256)
  set t_ut= | set ttyscroll=1
endif


"""" MARK Indentation, tab, and white space """"""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4
set softtabstop=4

"""" TODO: setup mapping for swapping modes
""""       also: start setting filetype defaults for this
set foldmethod=indent
set foldlevel=69
set foldcolumn=2

set autoindent " copy indent from current line when starting a new line
set smartindent " add indent after {

"" without this, Vim defaults to not letting you backspace on these  
set backspace=indent,eol,start
    
filetype on
filetype plugin on
filetype indent on
set expandtab " auto fill tabs with spaces

"" TODO: filetype defaults for - js, ts, json, yaml, tml, toml, php, fish
autocmd FileType yml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType vim setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType sh setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype html setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

"""" MARK View Management """"""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: understand this more
au FileType of call AdjustWindowHeight(3, 10)
function! AdjustWindowHieght(minheight, maxheight)
endfunction


"" TODO:
"" Good place to setup Python subsytems if desired


"""" MARK Mappings """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Space> <Nop>

nnoremap <Leader>e :Lexplore<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <F2> :source .vimrc<CR>


"" UI
nnoremap <Leader>urn :set relativenumber!<CR>
nnoremap <Leader>ucl :set cursorline!<CR>
nnoremap <Leader>ucc :set cursorcolumn!<CR>
nnoremap <Leader>uw :set nowrap!<CR>
nnoremap <Leader>ts :call ToggleScheme()<CR>

nnoremap <Leader>\| :vsplit<CR>
nnoremap <Leader>\ :split<CR>

nnoremap <Left> :bprev<CR>
nnoremap <Right> :bnext<CR>

nnoremap <Leader>zi :set foldmethod=indent<CR>
nnoremap <Leader>zs :set foldmethod=syntax<CR>
nnoremap <Leader>ze :set foldmethod=expr<CR>

" Move half page and center 
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" jump directionally aroud views
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Resize split windows using arrow keys by pressing:
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
" horizontal to vertical
map <Leader>th <C-w>t<C-w>H
" vertical to horizontal
map <Leader>tk <C-w>t<C-w>K

" move vertically by visual line (don't skip wrapped lines)
" reqires restart to start working
nmap j gj
nmap k gk

"" "" "" 
"" up and down arrow to highlight/wallkthrough lines

"" Clipboard ""
if system_name ==# "Darwin"
  set clipboard=unnamed
  noremap <Leader>y "*y
  noremap <Leader>p "*p
elseif system_name ==# "Linux"
  set clipboard=unnamedplus
  noremap <Leader>y "+y
  noremap <Leader>p "+p
endif

"" Search ""
" -clear search- 
nnoremap <Leader>/ :let @/ = ""<CR>
" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

"" add a quick search for MARK
nnoremap m /MARK<CR>  

"" Editing Enhancements ""
" set bindings to move whole lines up and down. 
" See below for more:
" https://vim.fandom.com/wiki/Moving_lines_up_or_down?veaction=edit&section=4
nnoremap j :m .+1<CR>==
nnoremap k :m .-2<CR>==
inoremap j <ESC>:m .+1<CR>==gi
inoremap k <ESC>:m .-2<CR>==gi
vnoremap j :m '>+1<CR>gv=gv
vnoremap k :m '<-2<CR>gv=gv

nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up> :m .-2<CR>==
inoremap <S-Down> <ESC>:m .+1<CR>==gi
inoremap <S-Up> <ESC>:m .-2<CR>==gi
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

" quick UPPERCASE and lowercase word before (applies to the word you're in if mid-word)
inoremap u <Esc>gUiw`]
nnoremap u gUiw`]
inoremap l <Esc>guiw`]
nnoremap l guiw`]

" insert blank lines from normal mode
nnoremap <Leader>o o<ESC>
nnoremap <Leader>O O<ESC>

"" TODO: investigate below behavior, also look at Astro <Leader>c and <Leader>C is force close
"" Close the current buffer and move to the previous one a la closing tabs
nnoremap <Leader>bd :bp! \| bd #<CR>


"""" MARK Functions """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" TODO: like the idea, but needs more thought
" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
""augroup cursor_off
""    autocmd!
""    autocmd WinLeave * set nocursorline nocursorcolumn
""    autocmd WinEnter * set cursorline cursorcolumn
""augroup END

" set Netrw keymaps
function! NetrwMapping()
    nmap <buffer> <Leader>e :Lexplore<CR>
endfunction

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END


