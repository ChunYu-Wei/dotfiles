# Features

## VIM
#### NerdTree
- `ctrl-n` : toggle NerdTree open/close
- `{k, k}` : navigate
- `o` : fold directory / open preview of file
- `x` : unfold directory
- `t` : open file in new tab
- `ctrl-t` : open file in new tab but focus on current tab
- `$ vim` : open the NerdTree in the current directory

#### NerdCommenter
- `\\` : toggle comment/uncomment

#### Tagber
- `ctrl-t` : toggle Tagbar open/close

#### Vim Tmux Navigator
- `ctrl-{h,j,k,l}` : navigate tmux/vim window using ctrl-{h, j, k, l}

#### Git
- `:G` : open smart git status interface
- `:G <COMMAND>` : execute git command in vim
- `:GV` : git log with `o` to preview and `ctrl-o` to open a tab for each commit

#### Jump between Brackets
- `[[` : jump between paired brackets

#### Clang Format
- automatically format c++ codes when `:w`
- the rules of the format is specified in .clang-foramt

#### Check Syntax
- automatically check the syntax of c++ codes when `:w`
- automatically jump to the first detected error
- mark error lines in red background

#### Fuzzy Finder
- `:Files` : open file finder
- `:Rg [KEYWORD]` : open ripgrep fidner
- `ctrl-{j,k}` : navigate between candidates
- `ctrl-o` : toggle preview window open/close
- `ctrl-t` : open the candidate file in new tab

#### Find Definition
- `]d` : go to definition of the keywork under the current cursor
- `[d` : back to the original content one stack

#### Automatically add matching brace
- automatically add } ) ] " ' when type { ( [ " '  with some words in the following
- two consecutive { ( [ " ' make a single { ( [ " '
- { ( [ " ' + \<CR\> aumatically indent and move cursor the a proper position
- \<\> make the cursor jump in between \< and \>

#### Autocomplete
- `<tab>` : autocomplete keywords

## TMUX
- `ctrl-a` : prefix
- `prefix |` : split window vertically
- `prefix -` : split window horizontally
- `prefix <NUM>` : select ith pane
- `prefix c` : create a new pane
- `prefix d` : delete the current pane
- `prefix z` : toggle focusing on a specific window

## Git
- `a` : add
- `st` : status --short
- `cm` : commit -v
- `cma` : commit --amend -v
- `rt` : restore
- `rts` : restore --staged
- `lg` : log --oneline --graph
- `lga` : log --oneline --graph --all
- `co` : checkout
- `br` : branch -vv
- `bra` : branch -vv --all
- `di` : diff
- `dis` : diff --stat
- `diw` : diff --color-words
- `dic` : diff --cached
- `dics` : diff --cached --stat
- `dicw` : diff --cached --color-words
- `dcw` : diff --cached --color-words
- `sh` : show
- `shs` : show --stat
- `shw` : show --color-words
- `rb` : rebase
- `rbc` : rebase --continue
