set nocompatible " required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)

" load language-specific config from ~/.vim/ftplugin/<language>.vim
Plugin 'ftplugin'

Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

Plugin 'tpope/vim-surround'

Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

Plugin 'tpope/vim-commentary'
" autocmd FileType <a filetype> setlocal commentstring=#\ %s

Plugin 'vim-scripts/indentpython.vim'
"Plugin 'Valloric/YouCompleteMe' "unable to install
Plugin 'nvie/vim-flake8'

Plugin 'Shougo/vimproc'
Plugin 'eagletmt/ghcmod-vim'

Plugin 'vim-syntastic/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" finder
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " requiredin VISUAL MODE  *  highlight selected

set encoding=utf-8

set nu
" set hlsearch

let python_highlight_all=1
syntax on

" Enable folding
" set foldmethod=indent
set foldmethod=manual
set foldlevel=99

" save all folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

set showcmd

" splits
set splitbelow
set splitright

" mapping

let mapleader = " "

let g:ycm_autoclose_preview_window_after_completion=1

" split navigators
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" hl in vmode
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>

"select text object (for `surround`)
nnoremap <C-x> ysiw

"continue yank-putting words from the upper string 
inoremap <C-c> @<Esc>kyWjPA<BS> 
nnoremap <C-c> @<Esc>kyWjPA<BS> 

nnoremap <Leader>h :help 
nnoremap <Leader>t :GhcModType<CR>
nnoremap <Leader>T :GhcModTypeClear<CR>
nnoremap <Leader>^ :GhcModTypeInsert<CR>
nnoremap <Leader>i :GhcModInfo<CR> 
nnoremap <Leader>I :GhcModInfoPreview<CR> 
nnoremap <Leader>s :GhcModSplitFunCase<CR> 
nnoremap <Leader>g :GhcModSigCodegen<CR> 
nnoremap <Leader>l :GhcModLint<CR>
nnoremap <Leader>c :GhcModCheck<CR> 
