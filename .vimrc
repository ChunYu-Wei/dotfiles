set nocompatible

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugin
call plug#begin('~/.vim/autoload')
Plug 'preservim/NERDTree'
Plug 'preservim/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'craigemery/vim-autotag'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'andymass/vim-matchup'
Plug 'rhysd/vim-clang-format'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'sjl/gundo.vim'
call plug#end()

" Gundo
nnoremap <C-G> :GundoToggle<CR>
let g:gundo_return_on_revert=0
let g:gundo_preview_height=14
let g:gundo_width=45
let g:gundo_help=0

" Markdown
let g:vim_markdown_folding_disabled = 1

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 1

" FZF
let g:fzf_preview_window = ['hidden,up,80%', 'ctrl-o']
let g:fzf_action = { 'ctrl-t': 'tab split' }
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.7, 'relative': v:true, 'yoffset': 1.0 } }

" ClangFormat
autocmd FileType cpp ClangFormatAutoEnable

" MatchUp
let g:matchup_matchparen_offscreen = {}
nnoremap <C-M> :MatchupWhereAmI??<CR>
nnoremap [[ %

" Tagbar
nnoremap <C-T> :TagbarToggle<CR>
let g:tagbar_autofocus=1

" NerdTree
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
nnoremap <C-N> :NERDTreeToggle<CR>

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
set t_Co=256
set background=dark
set timeoutlen=1000
set ttimeoutlen=5
set signcolumn=no
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
highlight LineNr ctermfg=white cterm=bold
highlight Pmenu ctermfg=gray ctermbg=234
highlight PmenuSel ctermbg=gray ctermfg=234
highlight SyntasticErrorLine ctermbg=196

" remap keybinding for tags find definition and tags pop
nnoremap [d <C-T>
nnoremap ]d <C-]>

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

" tab navigation
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt

" autocomplete
set complete=.,w,b,u,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" Use absolute line number in INSERT and relative line number in NORMAL
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
autocmd InsertEnter,InsertLeave * set cul!

" different cursor in different mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" vim status bar

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

" gundo status bar
let g:gundo_preview_statusline="%3* Gundo Preview %1* %P %3*"
let g:gundo_tree_statusline="%3* Gundo Tree %1* %P %3*"
