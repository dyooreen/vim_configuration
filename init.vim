" PLugins
call plug#begin('~/.local/share/nvim/plugged/')

	Plug 'ctrlpvim/ctrlp.vim' 
  Plug 'rakr/vim-one'
	Plug 'sbdchd/neoformat'
	Plug 'mxw/vim-jsx'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" THeme
let g:airline_theme='one'
set background=light        " for the light version
let g:one_allow_italics = 1 " I love italic for comments
colorscheme one
highlight Normal ctermbg=NONE

" VIm
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab

" FOrmating

" -- turn on formating
let g:neoformat_try_formatprg = 1
 
" -- auto format on save
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript,javascript.jsx,javascript.tsx setlocal formatprg=prettier\
                                                            \--stdin\
                                                            \--print-width\ 80\
                                                            \--single-quote\
                                                            \--trailing-comma\ es5
    autocmd BufWritePre *.js,*.jsx,*.tsx Neoformat
augroup END

" AUtocomplete

" -- use <enter> for autocomplete 
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" -- use <Tab> and <S-Tab> to navigate the completion list:

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir': 'node_modules\|dist',
    \ }
