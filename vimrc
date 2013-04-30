" WARNING:
"   * The Tagbar plugin needs 'exuberant ctags' to work.
"   * The Powerline plugin needs to have a patched font to be pretty.
"     You can install one of the fonts in '~/.vim/bundle/powerline-fonts'
"     and set your terminal to use it


"""""""""""""""""
" Vundle commands {{{
"""""""""""""""""


" Necesary for lots of cool vim things
set nocompatible

" Required for vundle
filetype on
filetype off

" Avoid SSL certificate problems
let $GIT_SSL_NO_VERIFY = 'true'

" Call vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Manage plugins (github repos)
Bundle 'gmarik/vundle'

" Add surround modifier to vim (s)
Bundle 'tpope/vim-surround'

" Suport repeat of surround actions
Bundle 'tpope/vim-repeat'

" % matches complex opening/closing entities
Bundle 'tsaleh/vim-matchit'

" Toggle comments (//)
Bundle 'tomtom/tcomment_vim'

" File browser (,t)
Bundle 'scrooloose/nerdtree'

" Syntax checker (,s)
Bundle 'scrooloose/syntastic'

" Show undo tree (,g)
Bundle 'sjl/gundo.vim'

" Run console commands (!command)
Bundle 'sjl/clam.vim'

" Show file tags list like variabes, etc (,l)
Bundle 'majutsushi/tagbar'

" Pretty status bar
Bundle 'Lokaltog/vim-powerline'

" Patched fonts for powerline
Bundle 'Lokaltog/powerline-fonts'

" Function and namespace highlighting
Bundle 'esneider/simlight.vim'

" Colorscheme
Bundle 'vim-scripts/kellys'

" Fuzzy file finder (,o)
Bundle 'kien/ctrlp.vim'

" More interactive find (,f)
Bundle 'gcmt/psearch.vim'

" Switch between source and header file (,h)
Bundle 'derekwyatt/vim-fswitch'

" Make NERDTree more awesome
Bundle 'jistr/vim-nerdtree-tabs'

" Ack search (,a)
Bundle 'mileszs/ack.vim'

" Automatic completion (select with tab)
Bundle 'Shougo/neocomplcache'

" Select regions in visual mode (+ and _)
Bundle 'terryma/vim-expand-region'

" Show repo diff signs (,d)
Bundle 'mhinz/vim-signify'

" Multiple cursors (next: Ctrl-P, prev: Ctrl-N, skip: Ctrl-X)
Bundle 'terryma/vim-multiple-cursors'

" }}}

"""""""""""""""
" Auto commands {{{
"""""""""""""""


" Remove any trailing whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Highlight characters after column 80
autocmd BufWinEnter * let w:m2=matchadd('CursorLine', '\%>80v.\+', -1)

" Restore cursor position to where it was before closing
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Use tabs in makefiles
autocmd FileType make setlocal noexpandtab

" Setup syntax completion by highligh rules for unsupported filetypes
autocmd Filetype *
  \ if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif

" Check for file changes after 'updatetime' milliseconds of cursor hold
autocmd CursorHold * checktime

" Clear window mark (SwapWindows function)
autocmd InsertLeave * silent! let g:windowToSwap = -1

" Disable Signify plugin at startup
autocmd VimEnter * silent! autocmd! signify BufWritePost *

" }}}

""""""""""""""""
" General config {{{
""""""""""""""""

" Enable file type specific behaviour
filetype plugin indent on

" Use utf8
set encoding=utf-8

" When I close a tab, remove the buffer
set nohidden

" Automatically read a file when it is changed from the outside
set autoread

" Automatically cd into the file's directory
set autochdir

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Entries of the commands history
set history=1000

" Entries of the undo list
set undolevels=1000

" Prevent some security exploits
set modelines=0

" Disable fucking bell
set vb t_vb=

" Faster commands
set ttimeout
set ttimeoutlen=50

" Fold text when markers {{{ and }}} are found
set foldmethod=marker

" Update after 1 second of no activity (check for external file change, etc)
set updatetime=1000

" Don't resize all remaining splits when opening/closing a split
set noequalalways

" Load menus
source $VIMRUNTIME/menu.vim

" Set Ctrl-Z to act like <Tab> on cmdline
set wcm=<C-Z>

" }}}

""""""""""""""""""""
" Directories config {{{
""""""""""""""""""""

" Make a backup of the original file when writing
set writebackup

" And don't delete it after a succesful write
set backup

" Directory for backups
set backupdir=~/.vim/.backup,~/tmp,/tmp

" Directory for swap files (avoids adding them to your repo by mistake)
set directory=~/.vim/.tmp//,~/tmp//,/tmp//

" Keep a persistent undo backup file
if has('persistent_undo')
    set undofile
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif

" }}}

""""""""""""""""""""""""""""
" Complete and search config {{{
""""""""""""""""""""""""""""


" Comand line completion stuff
set wildmenu
set wildmode=list:longest,full
set wildignore=*.swp,*.bak,*.pyc,*.class

" Tab completion stuff
set completeopt=longest,menuone

" Ignore case when searching
set ignorecase

" Unless upper case is used
set smartcase

" Use incremental searching (search while typing)
set incsearch

" Highlight things that we find with the search
set hlsearch

" search/replace globally (on a line) by default
set gdefault

" Set flags for grep command
set grepprg=grep\ -nH\ $*\ /dev/null

" }}}

""""""""""""""
" Input config {{{
""""""""""""""

" Enable autoindenting on new lines
set autoindent

" Copy the indent structure when autoindenting
set copyindent

" Use spaces instead of tabs (and be smart on newlines)
set expandtab
set smarttab

" Tab equals 4 spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Make backspace work like it should
set backspace=2

" Enable mouse support in console
set mouse=a

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Shift plus movement keys changes selection
set keymodel=startsel,stopsel

" Allow cursor keys to go right off end of one line, onto start of next
set whichwrap+=<,>,[,],h,l

" When at 3 spaces, and hit > ... go to 4, not 7
set shiftround

" Allowe the cursor one beyond last character and everywhere in V-block mode
set virtualedit=onemore,block

" Put new vertical splits to the right of the current one
set splitright

" Put new horizontal splits below the current one
set splitbelow

" }}}

""""""""""""""
" Style config {{{
""""""""""""""


" Enable syntax highlighting
syntax enable

" Show line numbers
set number

" Show status line
set laststatus=2

" This shows what you are typing as a command
set showcmd

" Have 5 lines ahead of the cursor in screen whenever possible
set scrolloff=5

" Highlight matching parent
highlight MatchParen ctermbg=4

" Highlight diff conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Highlight the line that the cursor is on
set cursorline

" Set font for MacVim
if has("gui_macvim")
    set guifont=Menlo:h15
end

" Force the tty to use 256 colors
if !has("gui_running")
  set t_Co=256
endif

" Dark background
set background=dark

" Set color scheme
silent! colorscheme kellys

" Highlight functions and namespaces
highlight SLFunction  guifg=#afdfdf ctermfg=152
highlight SLNamespace guifg=#a8a8a8 ctermfg=248

" Don't try to highlight lines longer than 500 characters
set synmaxcol=500

" }}}

"""""""""""""""""""""""""""""
" Windows and tabs navigation {{{
"""""""""""""""""""""""""""""


" Next tab (Ctrl-Shift-Right)
nnoremap <silent> <C-S-Right> :tabnext<CR>
inoremap <silent> <C-S-Right> <C-o>:tabnext<CR>

" Previous tab (Ctrl-Shift-Left)
nnoremap <silent> <C-S-Left> :tabprevious<CR>
inoremap <silent> <C-S-Left> <C-o>:tabprevious<CR>

" New tab (Ctrl-T)
nnoremap <silent> <C-t> :tabnew<CR>
inoremap <silent> <C-t> <C-o>:tabnew<CR>

" Move through splits with Alt-Shift-{Up,Right,Down,Left}
" For Mac
nnoremap <silent> <T-S-Up> :wincmd k<CR>
nnoremap <silent> <T-S-Down> :wincmd j<CR>
nnoremap <silent> <T-S-Left> :wincmd h<CR>
nnoremap <silent> <T-S-Right> :wincmd l<CR>
inoremap <silent> <T-S-Up> <C-o>:wincmd k<CR>
inoremap <silent> <T-S-Down> <C-o>:wincmd j<CR>
inoremap <silent> <T-S-Left> <C-o>:wincmd h<CR>
inoremap <silent> <T-S-Right> <C-o>:wincmd l<CR>
" For Linux
nnoremap <silent> <M-S-Up> :wincmd k<CR>
nnoremap <silent> <M-S-Down> :wincmd j<CR>
nnoremap <silent> <M-S-Left> :wincmd h<CR>
nnoremap <silent> <M-S-Right> :wincmd l<CR>
inoremap <silent> <M-S-Up> <C-o>:wincmd k<CR>
inoremap <silent> <M-S-Down> <C-o>:wincmd j<CR>
inoremap <silent> <M-S-Left> <C-o>:wincmd h<CR>
inoremap <silent> <M-S-Right> <C-o>:wincmd l<CR>

" Resize splits with Alt-{Up,Right,Down,Left}
" For Mac (with Alt-Cmd-Direction)
nnoremap <silent> <T-Up> :3wincmd +<CR>
nnoremap <silent> <T-Down> :3wincmd -<CR>
nnoremap <silent> <T-Left> :3wincmd <<CR>
nnoremap <silent> <T-Right> :3wincmd ><CR>
inoremap <silent> <T-Up> <C-o>:3wincmd +<CR>
inoremap <silent> <T-Down> <C-o>:3wincmd -<CR>
inoremap <silent> <T-Left> <C-o>:3wincmd <<CR>
inoremap <silent> <T-Right> <C-o>:3wincmd ><CR>
" For Linux
nnoremap <silent> <M-Up> :3wincmd +<CR>
nnoremap <silent> <M-Down> :3wincmd -<CR>
nnoremap <silent> <M-Left> :3wincmd <<CR>
nnoremap <silent> <M-Right> :3wincmd ><CR>
inoremap <silent> <M-Up> <C-o>:3wincmd +<CR>
inoremap <silent> <M-Down> <C-o>:3wincmd -<CR>
inoremap <silent> <M-Left> <C-o>:3wincmd <<CR>
inoremap <silent> <M-Right> <C-o>:3wincmd ><CR>

" }}}

""""""""""""""
" Key mappings {{{
""""""""""""""


" Map backspace key to dismiss search highlightedness
nnoremap <silent> <BS> :noh<CR>

" Turn off Vim’s regex characters and make searches use normal regexes
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Disable Ex mode
noremap Q <Nop>

" Up and down are more logical with g
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <C-o>gk
inoremap <silent> <Down> <C-o>gj

" Toggle folds with space
nnoremap <Space> za

" Center on the matching line when moving through search results
noremap N Nzz
noremap n nzz

" Remap jj to escape in insert mode
inoremap jj <Esc>

" Make Y consistent with C and D
nnoremap Y y$

" Repeat the last substitution
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Run console command (Clam plugin)
nnoremap ! :Clam<Space>
vnoremap ! :ClamVisual<Space>

" Toggle comments (tComment plugin)
nmap // gcc<Esc>
vmap // gc<Esc>

" Remain in visual mode after '<' or '>'
vnoremap < <gv
vnoremap > >gv

" Autocomplete next/prev with <Tab>/<S-Tab>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<Tab>"

" Don't yank (to the default register) when pasting in visual mode
vnoremap p "_dP

" }}}

""""""""""""""""""
" Command mappings {{{
""""""""""""""""""


" Some typo corrections
command! WQ wq
command! Wq wq
command! W w
command! Q q

" Save file with sudo
cnoremap w!! w !sudo tee % > /dev/null

" Ctrl-A to go to the start of line
cnoremap <C-A> <Home>

" }}}

"""""""""""""""""
" Leader mappings {{{
"""""""""""""""""


" Change mapleader
let mapleader=","

" Mark window for swap
nnoremap <silent> <Leader>w :call SwapWindows()<CR>

" Open the NERDTree Plugin
nnoremap <silent> <Leader>t :NERDTreeTabsToggle<CR>

" Open the Tagbar Plugin
nnoremap <silent> <Leader>l :TagbarToggle<CR>

" Open the Gundo Plugin
nnoremap <silent> <Leader>u :GundoToggle<CR>

" Check syntax with Syntastic plugin
nnoremap <silent> <Leader>s :w<CR>:SyntasticCheck<CR>

" Open the Syntastic plugin errors list
nnoremap <silent> <Leader>e :Errors<CR>

" Edit vimrc in a new tab
nnoremap <silent> <Leader>v :tabnew<CR>:e ~/.vimrc<CR>

" Jump to next diff conflict marker
nnoremap <silent> <Leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>

" Open the PSearch plugin
nnoremap <silent> <Leader>f :PSearch<CR>

" Switch between source and header file with FSwitch plugin
nnoremap <silent> <Leader>h :FSHere<CR>

" Find in files, with Ack plugin
nnoremap <Leader>a :Ack!<Space>""<Left>

" Paste from the SO clipboard
nnoremap <silent> <Leader>p "*p

" Yank to the SO clipboard
vnoremap <silent> <Leader>y "*y

" Vim menu
nnoremap <Leader>m :emenu <C-Z>

" Toggle repo diff signs
nnoremap <silent> <Leader>d :SignifyToggle<CR>

" }}}

""""""""""""""""
" Plugins config {{{
""""""""""""""""


" NERDTree plugin configuration
let NERDTreeDirArrows = 1
let NERDTreeWinSize = 25
let NERDTreeIgnore = ['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']

" NERDTreeTabs plugin configuration
let g:nerdtree_tabs_open_on_console_startup = 1

" Taglist plugin configuration
let g:tagbar_compact = 1
let g:tagbar_width = 30
let g:tagbar_usearrows = 1
let g:tagbar_sort = 0

" Gundo plugin configuration
let g:gundo_width = 30
let g:gundo_preview_height = 15
let g:gundo_right = 1

" Syntastic plugin configuration
let g:syntastic_loc_list_height = 5
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_mode_map = {'mode': 'passive'}


" Powerline plugin configuration
let g:Powerline_symbols = 'fancy'

" CtrlP plugin configuration
let g:ctrlp_map = '<Leader>o'
let g:ctrlp_max_height = 15
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_clear_cache_on_exit = 0

" Doxygen syntax configuration (javadoc highlighting for C, C++, C# files)
let g:load_doxygen_syntax = 1
let doxygen_javadoc_autobrief = 0

" Tex syntax configuration
let g:tex_flavor = 'latex'

" PSearch plugin configuration
let g:pse_max_height = 20

" SwapWindows function
let g:windowToSwap = -1

" Ack plugin configuration
let g:ackprg = "~/.vim/extras/ack.pl -H --nocolor --nogroup --column"

" NeoComplCache plugin configuration
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_wildcard = 0
let g:neocomplcache_enable_insert_char_pre = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_max_list = 7
let g:neocomplcache_omni_patterns = {}
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.python = ''

" Signify plugin configuration
let g:signify_sign_color_inherit_from_linenr = 1
let g:signify_update_on_bufenter = 0

" }}}

"""""""""
" Helpers {{{
"""""""""


function! SwapWindows()
    if g:windowToSwap == -1
        let g:windowToSwap = winnr()
        echom "Selected current window for swapping"
        return
    endif

    let curNum = winnr()
    let curBuf = bufnr("%")
    execute g:windowToSwap . "wincmd w"
    let markedBuf = bufnr("%")

    execute 'hide buf' curBuf
    execute curNum . "wincmd w"
    execute 'hide buf' markedBuf

    let g:windowToSwap = -1
endfunction

" }}}

