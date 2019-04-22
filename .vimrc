let mapleader = "\<Space>"
nnoremap <Leader>x /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap <Leader>X ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN
" switch to split pane below
nnoremap <Leader>j <C-W>j
" switch to split pane above
nnoremap <Leader>k <C-W>k
" switch to split pane right
nnoremap <Leader>l <C-W>l
" switch to split pane left
nnoremap <Leader>h <C-W>h
" quit buffer
nnoremap <Leader>q :q<cr>
" save and quit buffer
nnoremap <Leader>wq :wq<cr>
" open zshrc with leader+vr
nnoremap <Leader>sr :tabedit $MYZSHRC<CR> 
" open vimrc with leader+vr
nnoremap <Leader>vr :tabedit $MYVIMRC<CR> 
"source vimrc with leader+so
nnoremap <Leader>so :source $MYVIMRC<CR>
" toggle fold
nnoremap <Leader>f za
" vim session save
nnoremap <Leader>vss :mksession! ~/.vim_session<CR>
" vim session load
nnoremap <Leader>vsl :source ~/.vim_session<CR>
" open nerd tree 
nnoremap <Leader>nt :NERDTree<CR>
" run python script
nnoremap <Leader>py :! clear; python3 %<CR>
" run racket 
nnoremap <Leader>ra :! clear; racket master.rkt<CR>
" yank to clipboard
set clipboard=unnamed

" Toggle vertical line at 80 characters
set colorcolumn=
fun! ToggleCC()
  if &cc == ''
    " set cc=1,4,21
    set cc=80
  else
    set cc=
  endif
endfun
nnoremap <silent><Leader>tcc :call ToggleCC()<CR>

" Restore last cursor position and marks on open
au BufReadPost *
         \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
         \ |   exe "normal! g`\""
         \ | endif

set scrolloff=10
set relativenumber 


set nocompatible
filetype off

set splitright
set splitbelow

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set number
set backspace=indent,eol,start
set showmode
syntax on

" Vundle Config
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
Plugin 'nickaroot/vim-xcode-dark-theme'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
" Plugin 'vimwiki/vimwiki'

call vundle#end()
filetype plugin indent on

let g:vimwiki_list = [{'path': '~/vimwiki/',
                          \ 'syntax': 'markdown', 'ext': '.md'}]
filetype plugin on

set encoding=UTF8
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = ''

colorscheme xcode_dark

" Rainbow-Paren Config
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['gray',        'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END
