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
" open tmux with leader+tr
nnoremap <Leader>tr :tabedit ~/.tmux.conf<CR> 
" open zshrc with leader+zr
nnoremap <Leader>zr :tabedit ~/.zshrc<CR> 
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
" yank to clipboard
set clipboard=unnamed
" Prompt for a command to run
nnoremap <Leader>vp :VimuxPromptCommand<CR>
" Rerun last command
nnoremap <Leader>vl :VimuxRunLastCommand<CR>
" Insert line above and below
nnoremap <Leader>oo o<Esc>O
" Jump to end of enclosing parens
nnoremap <Leader>0 vib<Esc>l
" Jump to beginning of enclosing parens
nnoremap <Leader>9 vibo<Esc>h

" turn all bell sounds off
set belloff=all

" highlight long lines
" hi LineTooLong cterm=bold ctermbg=red guibg=LightYellow
" match LineTooLong /\%>80v.\+/

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

" set columns maker on
set cul
" change cursor in insert mode
let &t_SI = "\<Esc>[6 q"
" not sure what the other two really do yet
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

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

Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'VundleVim/Vundle.vim'
" Plugin 'haya14busa/incsearch.vim'
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
Plugin 'benmills/vimux'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'

call vundle#end()
filetype plugin indent on

autocmd BufNewFile,BufRead *.tsx,*.jsx,*.ts set filetype=typescript.tsx

let g:vimwiki_list = [{'path': '~/vimwiki/',
                          \ 'syntax': 'markdown', 'ext': '.md'}]
filetype plugin on

let NERDTreeMapOpenInTab='<ENTER>' " opens nerd tree files in new tab

set encoding=UTF-8
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = ''

colorscheme xcode_dark

silent! nmap <C-P> :GFiles<CR>

" Rainbow-Paren Config
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['gray',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['gray',        'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['gray',    'SeaGreen3'],
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

" tab colors
hi TabLineFill ctermfg=LightGreen ctermbg=Black
hi TabLine ctermfg=White ctermbg=Black
hi TabLineSel ctermfg=Cyan ctermbg=Black

" Highlights for TODO and FIXME
augroup myTodo
  autocmd!
  autocmd Syntax * syntax match myTodo /\v\_.<(TODO|FIXME).*/hs=s+1 containedin=.*Comment
augroup END
hi myTodo cterm=bold ctermbg=none ctermfg=cyan

" Highlights for matching parens
hi MatchParen cterm=bold ctermbg=white ctermfg=darkgray

" Code formatter
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
