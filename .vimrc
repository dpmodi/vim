"set runtimepath+=D:/dev/gvim/_vim_runtime
set nocompatible              " be iMproved, required
filetype off                  " required

set shell=/bin/bash
let myvimdir=expand('%:p:h').'/.vim/'
let myvimrcfolder=myvimdir.'vimrcs/'
" set the runtime path to include Vundle and initialize
"original set rtp+=/home/pdsoftware/.vim/bundle/Vundle.vim
let &rtp.=','.myvimdir.'bundle/Vundle.vim'
" alternatively, pass a path where Vundle should install plugins
call vundle#begin(myvimdir.'installedbundle')
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'Shutnik/jshint2.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bling/vim-airline'
Plugin 'burnettk/vim-angular'
Plugin 'elzr/vim-json'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'moll/vim-node'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomasr/molokai'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/vcscommand.vim'
Plugin 'majutsushi/tagbar'

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

for f in split(glob(myvimrcfolder.'*.vim'), '\n')
    exe 'source' f
endfor
