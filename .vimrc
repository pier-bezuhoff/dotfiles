set nocompatible " required
filetype off " required

" To update/install new plugins: reload .vimrc & run :PlugInstall
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes

Plug 'junegunn/seoul256.vim' " theme
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'dense-analysis/ale'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

colo seoul256

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


set visualbell

set history=1000
set encoding=utf-8

set nu
" set hlsearch

let python_highlight_all=1
syntax on

autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=0 expandtab

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

fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
" not my fault
call SetupCommandAlias("W","w")
call SetupCommandAlias("Q","q")
call SetupCommandAlias("Wq","wq")
call SetupCommandAlias("wQ","wq")
call SetupCommandAlias("WQ","wq")

" NOTE: use `gcc` to toggle commments
nnoremap <C-\> :Commentary<CR>j

let mapleader = " "

let g:ycm_autoclose_preview_window_after_completion=1

" split navigators
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" hl in vmode
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>

" select text object (for `surround`), idt it works :/
nnoremap <C-x> ysiw

" continue yank-putting words from the upper string 
inoremap <C-c> @<Esc>kyWjPA<BS> 
nnoremap <C-c> @<Esc>kyWjPA<BS> 

nnoremap <Leader>h :help 
" haskell
nnoremap <Leader>t :GhcModType<CR>
nnoremap <Leader>T :GhcModTypeClear<CR>
nnoremap <Leader>^ :GhcModTypeInsert<CR>
nnoremap <Leader>i :GhcModInfo<CR> 
nnoremap <Leader>I :GhcModInfoPreview<CR> 
nnoremap <Leader>s :GhcModSplitFunCase<CR> 
nnoremap <Leader>g :GhcModSigCodegen<CR> 
nnoremap <Leader>l :GhcModLint<CR>
nnoremap <Leader>c :GhcModCheck<CR> 

" uhh
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
