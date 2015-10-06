set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim' " plugin to handle automatic (or almost) installation of the following plugins
Plugin 'mattn/emmet-vim' " gives awesome html auto completion
Plugin 'Valloric/YouCompleteMe' " adds all the content of omni completion into baloons for easy access
Plugin 'marijnh/tern_for_vim' " adds custom functions into vim's omni completion. Also has rename, type, references, etc functionalities.
Plugin 'kien/ctrlp.vim' " to open files in your working directory and even find functions within files
Plugin 'scrooloose/syntastic' " syntax checking plugin displaying errors in left margin and highlights
Plugin 'vim-scripts/Smart-Tabs' " to have tabs for indentation and spaces for alignment

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

:let mapleader=","

"
" set line number toggle function
"
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set nonumber
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>
set relativenumber

syntax on
set ignorecase
set splitright
" set paste -- not compatible with Emmet <C-y>XYZ command in insert mode
set viminfo='20,\"100,:20,%,n~/.viminfo
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
hi SpecialKey ctermfg=8 guifg=#649A9A
set list

"
" improvement to window split navigation and resizing
"
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

nmap + <C-w>+
nmap - <C-w>-
nmap > <C-w>>
nmap < <C-w><

"
" set tab widths -- goes with smart-tabs plugin
"
set shiftwidth=4
set tabstop=4

"
" CtrlP - Setup some default ignores
"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pdf
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|node_modules)|build$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg|pdf)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"
" Emmet-vim - change auto complete shortcut
"
imap <C-Space> <C-y>,
vmap <C-Space> <C-y>,

"
" Tern-for-vim - configuration
"
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

nmap <Leader>tt :TernType<cr>
nmap <Leader>td :TernDef<cr>
nmap <Leader>trr :TernRename<cr>
nmap <Leader>tr :TernRefs<cr>

"
" Syntastic config -- need to execute "npm install -g jshint" to install
" jshint
"
" This does what it says on the tin. It will check your file on open too, not just on save.
" You might not want this, so just leave it out if you don't.
let g:syntastic_check_on_open=1
