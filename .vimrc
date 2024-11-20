" :set guifont=*
set guifont=Monospace\ 20

let mapleader = " " " map leader to Space
""" plugins

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_working_path_mode = 'c'
map gyy :CtrlPMixed<CR>
map gyb :CtrlPBuffer<CR>
map gyf :CtrlP<CR>


Plugin 'tpope/vim-surround'

" All of your Plugins must be addeda before the following line
Plugin 'prabirshrestha/vim-lsp'
Plugin 'mattn/vim-lsp-settings'

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

" Enable plugins and load plugin for the detected file type.
filetype off                  " required
filetype plugin on

let g:lsp_diagnostics_enabled = 0

" commands in rus
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz


"""plugins

" Turn syntax highlighting on.
syntax on

set number
" Enable line numbers

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=200

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" remove toolbar
:set guioptions-=T

" set my vim colorscheme
colorscheme evening

" clipboard enable! Unnamedplus messes with my greenclip so i need another solution. Shame i cant do same with Emacs
imap <C-v> <ESC>"+pa
" clippppp
set clipboard=unnamedplus


" disable greeting
set shm+=I

" disable swap - maybe remove later 
set noswapfile

"command history to copypaste
nmap <C-h> <ESC>q:



":command Pfile put ='add jar hdfs:///user/das/deploy/das-hive-commons/${das_hive_commons_release_type}/das-hive-commons-${das_hive_commons_version}_${das_hive_commons_branch}/lib/dc-hive-udf-${das_hive_commons_version}.jar;' . \"\n\" . 'create temporary function dws_test_format' . \"\n\" . 'as ''ru.russianpost.dc.functions.DwsTextFormat''' . \"\n\" . 'using jar ''hdfs:///user/das/deploy/das-hive-commons/${das_hive_commons_release_type}/das-hive-commons-${das_hive_commons_version}_${das_hive_commons_branch}/lib/dc-hive-udf-${das_hive_commons_version}.jar'';' | :%s@translate(\([a-zA-Z\._]\+\)[a-zA-Z,\t \'\"\\]\+)@dws_test_format(\1)@g
":command Prepl :%s@translate(\([a-zA-Z0-9\._]\+\)[a-z0-9A-Z,\t \'\"\\]\+)@dws_test_format(\1)@g

":command Pwrappy :.,$s@\([`a-zA-Z\._]\+\)@dws_test_format(\1)@gc

"file yanking
"gg"+yG
nmap <C-s> :let @+ = expand("%:p")<CR>
nmap <C-a> gg"+yG<CR>
"nmap <C-a> :%y"+<CR>

"f2 prefix
nnoremap <F2>r :source ~/.vimrc<CR>
nnoremap <F2>i :PluginInstall<CR>
nnoremap <F2>u :PluginUpdate<CR>
nnoremap <F2>w :w !sudo tee %<CR>

au BufEnter,BufNew *.py map <leader>dt :! python %
