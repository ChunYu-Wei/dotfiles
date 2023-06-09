set nocompatible

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugin
call plug#begin('~/.vim/autoload')
Plug 'preservim/NERDTree'
Plug 'preservim/nerdcommenter'
call plug#end()

" NerdTree
nnoremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | q | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | q | endif

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
nnoremap \\ :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap \\ :call nerdcommenter#Comment(0,"toggle")<CR>

" configuration
syntax enable
set clipboard=unnamed
set wildmenu
set number
set relativenumber
highlight LineNr ctermfg=white cterm=bold
set noruler
set ignorecase
set smartcase
set incsearch
set cindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set confirm
set backspace=indent,eol,start
set history=500
set cursorline
set showcmd
set showmode
set nowrap
set autowrite
set mouse=a
set hlsearch
set noshowmode

" automatically add matching brace
inoremap ( ()<Left>
inoremap (( (
inoremap (<CR> <Esc>o(<Esc>o)<Esc>O
inoremap { {}<Left>
inoremap {{ {
inoremap {<CR> <Esc>o{<Esc>o}<Esc>O
inoremap [ []<Left>
inoremap [[ [
inoremap " ""<Left>
inoremap "" "
inoremap ' ''<Left>
inoremap '' '
inoremap <> <><Left>

" disable arrow keys
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" status bar

augroup statusline
    autocmd!
    autocmd CmdlineEnter * redrawstatus
augroup END

set laststatus=2
set statusline=
set statusline+=%2*
set statusline+=\ 
set statusline+=%{StatuslineMode()}
set statusline+=\ 
set statusline+=%3*
set statusline+=\ 
set statusline+=%f
set statusline+=\ 
set statusline+=%y
set statusline+=\ 
set statusline+=%1*
set statusline+=\ 
set statusline+=%P
set statusline+=\ 
set statusline+=%3*
set statusline+=%=
set statusline+=\ 
set statusline+=%F
set statusline+=\ 

hi User1 ctermbg=darkgray ctermfg=white cterm=bold
hi User2 ctermbg=lightgrey ctermfg=237 cterm=bold
hi User3 ctermbg=234 ctermfg=250 cterm=bold

function! StatuslineMode()
    let l:mode=mode()
    if l:mode==#"c"
        return "COMMAND"
    elseif l:mode==#"n"
        return "NORMAL"
    elseif l:mode==#"t"
        return "TERMINAL"
    elseif l:mode==?"v"
        return "VISUAL"
    elseif l:mode==#"i"
        return "INSERT"
    elseif l:mode==#"R"
        return "REPLACE"
    elseif l:mode==?"s"
        return "SELECT"
    elseif l:mode==#"!"
        return "SHELL"
    endif
endfunction
