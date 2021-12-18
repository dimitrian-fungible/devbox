" TO RELOAD .vimrc
" :so % 

" :help args
" :help argadd
" :help argdelete

" Enable mouse (e.g. for drag-n-drop window borders)
" :help mouse
" set mouse=n
set mouse=""
set ttymouse=xterm2

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
" To get the filetype:
" :set filetype?
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript.jsx setlocal shiftwidth=2 tabstop=2

" try redrawing as fewer times as possible.
:set lazyredraw 
:set ttyfast

" Long lines make VIM slow
:set synmaxcol=255

" folding
" anything other than 'syntax'
set foldmethod=indent

" list of options for Insert mode completion
" Use the popup menu also when there is only one match.
" preview - opens a preview windows Ctrl-w z to close the preview window
set completeopt=menuone,noinsert,noselect

" Show vertical line 
" set colorcolumn=120

" save marks between session (uppercase or numberic) 
" more info
" :he 21.3
" :he E20
" :mksession
:set viminfo='1000,f1

" make backspace work like most other programs
" :help 'backspace'
set backspace=indent,eol,start

" syntax highlighting 
syntax on

" show line numbers 
" to turn off: 
" set nonumber
" set number!
" set relativenumber
" turn hybrid line numbers on
" :set number relativenumber
" :set nu rnu

" disable word wrap by default
set wrap!

" always show status line
" set laststatus=2
" show filename in the status line
" set statusline+=%F

" highlight all search pattern matches
" :nohlsearch
:set hlsearch

" Show file options above the command line
" :h 'wildmenu'
set wildmenu
" set wildmode=longest:full,full
set wildmode=longest:list,full
" To make it work recursively with eg :find <filename>
set path+=**

" Show invisible characters
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
" turn on:
" set list 

" disable auto indent on paste 
" By configuring set paste, you're effectively disabling all mappings and abbreviations.
" You only need that set when you actually paste text in terminal Vim! It's best to bind this to a key. 
" set paste

" set auto indentation
set autoindent
set smartindent

" spellcheck
" set spell spelllang=en_us
"      set spellsuggest=fast,20 "Don't show too much suggestion for spell
"      check.
"           set spellfile=~/Dropbox/Tool/Vim_Spell_add/en.utf-8.add
set spell spelllang=en_us
set spellsuggest=fast,20
" NOTE: Below solution is only for text files, for other types it's a bit more tricky 
" Don't mark URL-like things as spelling errors
" defining a new syntax highlighting group called UrlNoSpell (could be called
" whatever you want), and when text matches the pattern, we mark it with the
" special highlight group
syn match UrlNoSpell '\w\+:\/\/[^[:space:]]\+' contains=@NoSpell
" Don't count acronyms / abbreviations as spelling errors
" (all upper-case letters, at least three characters)
" Also will not count acronym with 's' at the end a spelling error
" Also will not count numbers that are part of this
" Recognizes the following as correct:
syn match AcronymNoSpell '\<\(\u\|\d\)\{3,}s\?\>' contains=@NoSpell
" turn off by default
set nospell


" syntax highlight for markdown, set to .markdown by default.
" set syntax=markdown
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Highlight current line
set cursorline 

" logs highlight
" autocmd BufNewFile,BufReadPost *messages* :set filetype=messages
" :set filetype=messages

" turn off autoindent when you paste code, there's a special 'paste' mode
" :set paste
" :set nopaste
" set pastetoggle=<F3>

" word wrapping 
":set wrap!
":set nowrap

" COLOR SCHEME
" list of colors:
" :h cterm-colors
" list of types to highlight:
" :hi
hi Search cterm=NONE ctermfg=black ctermbg=yellow
hi String cterm=NONE ctermfg=brown
" hi String cterm=NONE ctermfg=4
hi Keyword cterm=NONE ctermfg=blue
hi Statement cterm=NONE ctermfg=blue
hi Type cterm=NONE ctermfg=blue
" hi DiffAdd cterm=NONE ctermfg=black ctermbg=LightBlue
hi DiffAdd cterm=NONE ctermfg=black ctermbg=green
hi DiffDelete cterm=NONE ctermfg=black ctermbg=red
hi DiffChange cterm=NONE ctermfg=black
hi DiffText cterm=NONE ctermfg=black
" hi Function cterm=NONE ctermfg=blue
" hi Function cterm=NONE ctermfg=5
" hi Function cterm=NONE ctermfg=white
" hi Function cterm=NONE ctermfg=lightgreen
hi Function cterm=NONE ctermfg=darkgreen
hi Constant cterm=NONE ctermfg=blue
hi SpellBad cterm=NONE ctermfg=black
hi Folded cterm=NONE ctermfg=gray ctermbg=none
hi ColorColumn ctermbg=8
hi ColorColumn ctermbg=6
hi Comment cterm=NONE ctermfg=gray
hi Visual cterm=NONE ctermfg=black ctermbg=white

" completion using a syntax file
" enable omni completion using a syntax file:
" setlocal omnifunc=syntaxcomplete#Complete
" enable omni if it is not set yet:
" if has("autocmd") && exists("+omnifunc")
"   autocmd Filetype *
"           \ if &omnifunc == "" |
"           \     setlocal omnifunc=syntaxcomplete#Complete |
"           \ endif
" endif

" BEGIN: Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"OFF: Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"OFF: Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"OFF: Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" YouCompleteMe
" Plugin 'Valloric/YouCompleteMe'

" Cheat sheet 
"Plugin 'dbeniamine/cheat.sh-vim'

" FZF
" for :Ag you need to install the_silver_searcher
" https://github.com/ggreer/the_silver_searcher
" example of fzf based vimrc
" https://github.com/junegunn/dotfiles/blob/master/vimrc
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Switch .h => .cpp (doesn't work for different include and src locations)
" Plugin 'derekwyatt/vim-fswitch'

" Insert or delete brackets, parens, quotes in pair.
" Plugin 'jiangmiao/auto-pairs'

" The enhanced C++ syntax highlighting.
"Plugin 'octol/vim-cpp-enhanced-highlight'

" tagbar 
Plugin 'majutsushi/tagbar'

" Switch between different file projections (alternatives e.g. *.h => *.cpp)
" Plugin 'tpope/vim-projectionist'

" press "-" to open the file location for the current buffer (NERDTree will do
" the same)
" Plugin 'tpope/vim-vinegar'

" Plugin 'Konfekt/FastFold'

" CMake helper
" Plugin 'vhdirk/vim-cmake'

" The NERDTree
Plugin 'scrooloose/nerdtree'

" Vastly improved Javascript indentation and syntax support in Vim.
" Plugin 'pangloss/vim-javascript'

" quickly and easily switch between buffers
" Plugin 'jlanzarotta/bufexplorer'

" Python IDE
Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" END: Vundle

" Pymode config
let g:pymode_rope = 1
let g:pymode_rope_goto_definition_bind='<Leader>rg'
let g:pymode_rope_rename_bind = '<Leader>rr'
let g:pymode_run_bind = '<leader>rR'
let g:pymode_rope_show_doc_bind = '<Leader>rd'
let g:pymode_breakpoint_bind = '<leader>rb'
" let g:pymode_python = 'python'

" YouCompleteMe config
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" let g:ycm_min_num_of_chars_for_completion = 3
" let g:ycm_min_num_identifier_candidate_chars = 2
" let g:ycm_add_preview_to_completeopt = 1
let g:ycm_auto_trigger = 1
" let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_show_diagnostics_ui = 0

" Sessions 
" :mksession ~/.vim/sessions/my-session.vim
" :source ~/.vim/sessions/my-session.vim
" When the cycle repeats as you rearrange the furniture, just overwite the old  session by using 
" :mks!

" NERDTree file filters 
" let NERDTreeIgnore=['.git$[[dir]]', '.swp']
" let NERDTreeIgnore=['.cpp']

" Persistent folds
" :h viewdir
"augroup AutoSaveFolds
"    autocmd!
"    autocmd BufWinLeave * mkview
"    autocmd BufWinEnter * silent! loadview 
"augroup END

fun! ToggleCC()
  if &cc == ''
    set colorcolumn=120
  else
    set colorcolumn=
  endif
endfun

function PasteFromClipboard()
    set paste
    startinsert
endfunction

function! GFilesFallback_BAD()
  let output = system('git rev-parse --show-toplevel') " Is there a faster way?
  let prefix = get(g:, 'fzf_command_prefix', '')
  if v:shell_error == 0
    exec "normal :" . prefix . "GFiles\<CR>"
  else
    exec "normal :" . prefix . "Files\<CR>"
  endif
  return 0
endfunction

" If git directory, use `git ls-files` as source, else fallback to vanilla fzf
function! GFilesFallback()
  let prefix = get(g:, 'fzf_command_prefix', '')
  let output = system('git rev-parse --is-inside-work-tree')
  if output =~ 'true'
    exec "normal :" . prefix . "GFiles\<CR>"
  else
    exec "normal :" . prefix . "Files\<CR>"
  endif
  return 0
endfunction

" Open Ag with GIT root
function! s:with_git_root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  return v:shell_error ? {} : {'dir': root}
endfunction

let g:fzf_layout = { 'down': '~40%' }
command! -nargs=* Rag
  \ call fzf#vim#ag(<q-args>, extend(s:with_git_root(), g:fzf_layout))

":Ag  - Start fzf with hidden preview window that can be enabled with "?" key
":Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Disable nopaste after leave insert mode
autocmd InsertLeave * set nopaste

function ToggleW()
    set list! spell! wrap!
    call ToggleCC()
endfunction

let mapleader=' '
let maplocalleader=' '
imap jk <Esc>
map <Leader>p :call PasteFromClipboard()<CR>
map <Leader>w :call ToggleW()<CR>

" search in selection 
" by using the \%V atom
" press Alt-/ in order to automatically fill in a 'range' for your search
"  When you have selected the area you want to search, press Alt-/. The visual
"  selection will be removed, and a search command will start. You will see:
"  /\%V
vnoremap <Leader>/ <Esc>/\%V

" vim-projectionist
noremap <silent> <Leader>aa         :A<CR>
" navigating quickfix window
noremap <silent> <Leader>.          :cnext<CR>
noremap <silent> <Leader>,          :cprevious<CR>

" FZF
nnoremap <c-p> :call GFilesFallback()<CR>
" nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":call GFilesFallback()<CR>"
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>l        :BLines<CR>
nnoremap <silent> <Leader>L        :Lines<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
nnoremap <silent> <Leader>`        :Marks<CR>
nnoremap <silent> <Leader>o        :History<CR>
nnoremap <silent> <Leader>t        :BTags<CR>
nnoremap <silent> <Leader>T        :TagbarOpenAutoClose<CR>
nnoremap <silent> <Leader>nn       :NERDTreeToggle<CR>
nnoremap <silent> <Leader>nf       :NERDTreeFind<CR>
