let mapleader = " "
let maplocalleader = " "

set nocompatible " make vim behave more useful
let system_name = substitute(system('uname'), '\n', '', '') " for later

if &shell =~# 'fish$'
  set shell=sh
endif

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

set fillchars=stl:=,stlnc:-,fold:=

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
  call SetColorScheme("tokyonight")

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


"" Good place to setup Python subsytems if desired


"""" MARK Mappings """""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <Left> 0
nnoremap <Right> $

nnoremap <Space> <Nop>

nnoremap <silent> <Leader>n :enew<CR>
nnoremap <silent> <Leader>c :bdelete<CR>
nnoremap <silent> <Leader>C :bdelete!<CR>
nnoremap <silent> <Leader>e :Lexplore<CR>
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>Q :q!<CR>
nnoremap <silent> <Leader>wq :wq<CR>

nnoremap <silent> <Leader><Tab> :bnext<CR>
nnoremap <silent> <Leader><S-Tab> :bprev<CR>

nnoremap <silent> <F2> :source ~/.vimrc<CR>

"" UI
nnoremap <silent> <Leader>urn :set relativenumber!<CR>
nnoremap <silent> <Leader>ucl :set cursorline!<CR>
nnoremap <silent> <Leader>ucc :set cursorcolumn!<CR>
nnoremap <silent> <Leader>uw :set nowrap!<CR>
nnoremap <silent> <Leader>ts :call ToggleScheme()<CR>
nnoremap <silent> <Leader>tn :tabnew<CR>

nnoremap <silent> \| :vsplit<CR>
nnoremap <silent> \ :split<CR>

nnoremap <silent> <Leader>tc :tabclose<CR>
nnoremap <silent> <Leader>t[ :tabprev<CR>
nnoremap <silent> <Leader>t] :tabnext<CR>

"" Toggle two views
nnoremap <F8> <C-w>x
"" Rotate back and forth through a row or column
nnoremap <F9> <C-w>r
nnoremap <F7> <C-w>R

nnoremap <Leader>zi :set foldmethod=indent<CR>
nnoremap <Leader>zs :set foldmethod=syntax<CR>
nnoremap <Leader>ze :set foldmethod=expr<CR>

nnoremap <Leader>. $

" Move half page and center 
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <Down> <C-d>zz
nnoremap <Up> <C-u>zz

" jump directionally aroud windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"" move windows around, oddly...
nnoremap <S-Down> <C-w>J
nnoremap <S-Up> <C-w>K
nnoremap <S-Left> <C-w>H
nnoremap <S-Right> <C-w>L

" Resize split windows using arrow keys by pressing:
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" fast equalize splits
nnoremap <leader>u= <C-w>=
" not sure why this isn't working
" inoremap <C-=> <C-w>=
vnoremap <leader>u= <C-w>=

"" See for more info https://vim.fandom.com/wiki/Resize_splits_more_quickly

"" Resize Splits by thirds 
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Change 2 split windows from vert to horiz or horiz to vert
" horizontal to vertical
nnoremap <Leader>\| <C-w>t<C-w>H
" vertical to horizontal
nnoremap <Leader>\ <C-w>t<C-w>K

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk

"" "" "" 
"" up and down arrow to highlight/wallkthrough lines

"" Clipboard ""
if system_name ==# "Darwin"
  set clipboard=unnamed
""  noremap <Leader>y "*y
""  noremap <Leader>p "*p
elseif system_name ==# "Linux"
  set clipboard=unnamedplus
""  noremap <Leader>y "+y
""  noremap <Leader>p "+p
endif

"" paste from stable '0' register
"" MARK: make decision together with this and blocks above 
nnoremap <leader>p "0p 
nnoremap <leader>P "0P 

"" yank line w/no newline
nnoremap Y mm_y$`m
"" delete line (since D defaults to same as d$
nnoremap D _d$

"" Search ""
" -clear search- 
nnoremap <silent> <Leader>h :noh<CR>    

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

"" add a quick search for MARK
nnoremap m /MARK<CR>  

"" Editing Enhancements ""
" set bindings to move whole lines up and down. 
" See below for more:
" https://vim.fandom.com/wiki/Moving_lines_up_or_down?veaction=edit&section=4
nnoremap <silent> j :m .+1<CR>==
nnoremap <silent> k :m .-2<CR>==
inoremap <silent> j <ESC>:m .+1<CR>==gi
inoremap <silent> k <ESC>:m .-2<CR>==gi
vnoremap <silent> j :m '>+1<CR>gv=gv
vnoremap <silent> k :m '<-2<CR>gv=gv

nnoremap <silent> S-Down> :m .+1<CR>==
nnoremap <silent> S-Up> :m .-2<CR>==
inoremap <silent> S-Down> <ESC>:m .+1<CR>==gi
inoremap <silent> S-Up> <ESC>:m .-2<CR>==gi
vnoremap <silent> S-Down> :m '>+1<CR>gv=gv
vnoremap <silent> S-Up> :m '<-2<CR>gv=gv

"" indented blocks
nnoremap <leader>{} vip$<ESC>a<CR>}<ESC>{i{<ESC>vi{><ESC>

"" {word} to { \n } TOdO: Still needs work
nnoremap <F4> di{i<CR><ESC>O<ESC>P>>$a,<ESC>
"" wrap word in { }
nnoremap <F3>{ diwi{}<ESC>P
nnoremap <F3>[ diwi[]<ESC>P
nnoremap <F3>( diwi()<ESC>P
nnoremap <F3>" diwi""<ESC>P
nnoremap <F3>' diwi''<ESC>P
nnoremap <F3>< diwi<><ESC>P

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

" TODO TODO TODO MARK TODO TODO TODO
"""""""""""""""""""""""-- smart deletion, dd
"""""""""""""""""""""""-- It solves the issue, where you want to delete empty line, but dd will override your last yank.
"""""""""""""""""""""""-- Code below will check if u are deleting empty line, if so - use black hole register.
"""""""""""""""""""""""-- [src: https://www.reddit.com/r/neovim/comments/w0jzzv/comment/igfjx5y/?utm_source=share&utm_medium=web2x&context=3]
"""""""""""""""""""""""local function smart_dd()
"""""""""""""""""""""""	if vim.api.nvim_get_current_line():match("^%s*$") then
"""""""""""""""""""""""		return "\"_dd"
"""""""""""""""""""""""	else return "dd" end
"""""""""""""""""""""""end
"""""""""""""""""""""""vim.keymap.set("n", "dd", smart_dd, { noremap = true, expr = true })

"""""""""""""""""""""""""--[[
"""""""""""""""""""""""""	easier moving of code blocks
"""""""""""""""""""""""""	Try to go into visual mode (v), thenselect several lines of code
"""""""""""""""""""""""""      here and then press ``>`` several times.
"""""""""""""""""""""""""--]]
"""""""""""""""""""""""""keymap('v', '<', '<gv', options)
"""""""""""""""""""""""""keymap('v', '>', '>gv', options)
"""""""""""""""""""""""""
"""""""""""""""""""""""""-- going back to normal mode which works even in vim's terminal
"""""""""""""""""""""""""-- you will need this if you use floaterm to escape terminal
"""""""""""""""""""""""""keymap('t', '<Esc>', '<c-\\><c-n

""""""""""local init_color_fg = vim.api.nvim_get_hl_by_name("CursorLineNr", true).foreground
""""""""""local init_color_bg = vim.api.nvim_get_hl_by_name("CursorLineNr", true).background
""""""""""api.nvim_create_autocmd(
""""""""""	{ 'ModeChanged', 'InsertLeave'},
""""""""""	{
""""""""""		desc = "change cursor color on mode change",
""""""""""		group = group,
""""""""""		callback = function()
""""""""""			local mode = vim.api.nvim_get_mode().mode
""""""""""			if mode == "i" then
""""""""""				api.nvim_set_hl(0, "CursorLineNr", {fg="#000000", bg="#ac3131", bold=true})
""""""""""			elseif mode == "v" or mode == "V" or mode == "" then
""""""""""				api.nvim_set_hl(0, "CursorLineNr", {fg="#000000", bg="#d1d1d1", bold=true})
""""""""""			else
""""""""""				vim.api.nvim_set_hl(0, "CursorLineNr", {fg=init_color_fg, bg=init_color_bg, bold=true})
""""""""""			end
""""""""""		end,
""""""""""	}
"""""""""")



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


