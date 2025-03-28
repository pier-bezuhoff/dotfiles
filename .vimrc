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
"Plug 'leafOfTree/vim-svelte-plugin'
Plug 'evanleck/vim-svelte'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

"" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" Prettier Settings
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_require_pragma = 0
" let g:prettier#autoformat = 0
au BufWritePre *.css,*.svelte,*.pcss,*.ts,*.js,*.json PrettierAsync
"au BufWritePre *.css,*.svelte,*.pcss,*.html,*.ts,*.js,*.json PrettierAsync

" reference: https://codechips.me/vim-setup-for-svelte-development/
" COC
let g:coc_node_path = '/usr/bin/node'

nmap ff (coc-format-selected)
nmap rn (coc-rename)
nmap gd (coc-definition)
nmap gy (coc-type-definition)
nmap gi (coc-implementation)
nmap gr (coc-references)

set updatetime=300
set shortmess+=c " don't give |ins-completion-menu| messages.

" Use K to show documentation in preview window
nnoremap  K :call show_documentation()

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('')
  else
    call CocAction('doHover')
  endif
endfunction

" color scheme
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
autocmd FileType svelte setlocal shiftwidth=2 tabstop=2

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
" nnoremap <Leader>t :GhcModType<CR>
" nnoremap <Leader>T :GhcModTypeClear<CR>
" nnoremap <Leader>^ :GhcModTypeInsert<CR>
" nnoremap <Leader>i :GhcModInfo<CR> 
" nnoremap <Leader>I :GhcModInfoPreview<CR> 
" nnoremap <Leader>s :GhcModSplitFunCase<CR> 
" nnoremap <Leader>g :GhcModSigCodegen<CR> 
" nnoremap <Leader>l :GhcModLint<CR>
" nnoremap <Leader>c :GhcModCheck<CR> 

" uhh
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap ё `
nnoremap ш i
nnoremap й q
nnoremap ц w
nnoremap у e
nnoremap к r
nnoremap е t
nnoremap н y
nnoremap г u
nnoremap щ o
nnoremap з p
nnoremap х [
nnoremap ъ ]
nnoremap ф a
nnoremap ы s
nnoremap в d
nnoremap а f
nnoremap п g
nnoremap р h
nnoremap о j
nnoremap л k
nnoremap д l
nnoremap ж ;
nnoremap э '
nnoremap я z
nnoremap ч x
nnoremap с c
nnoremap м v
nnoremap и b
nnoremap т n
nnoremap ь m
nnoremap б ,
nnoremap ю .
nnoremap Ф A
nnoremap Ш I
nnoremap сц cw
nnoremap вц dw
" nnoremap . /
