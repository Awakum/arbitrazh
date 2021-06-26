" GENERAL SETTINGS
set enc=utf-8
set langmenu=en_US.UTF-8    " sets the language of the menu (gvim)
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
set nobackup
set nowritebackup
set autoindent
set smartindent
set backspace=indent,eol,start
set shortmess-=S
set wrap linebreak nolist
set cursorline
set ruler
set hlsearch
set cursorcolumn
set cursorline
set t_Co=256
" let g:netrw_browse_split=4      " Open file in previous buffer

set clipboard=unnamed " use the clipboards of vim and win
set paste                   " Paste from a windows or from vim
set belloff=all

filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=0
set smarttab


set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set foldmethod=indent

if has("gui_running")
  set guioptions -=m
  set guioptions=Ace
  set guioptions -=T
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim") set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h10:cANSI
    set rtp +=~/vimfiles
  endif
  language en  " sets the language of the messages / ui (vim)
endif


" KEYMAPS
nmap Ж :
nmap Н Y
nmap з p
nmap ф a
nmap щ o
nmap г u
nmap З P
nmap + gg=G<C-o><C-o>
nnoremap <F2> :set hlsearch!<CR>
noremap <silent> <C-k> gk
noremap <silent> <C-j> gj
nnoremap <silent> <leader>P :pu<CR>
nnoremap <silent> <Leader>b :TagbarToggle<CR>
nnoremap c "_c
xnoremap c "_c
nnoremap <leader>c c
nnoremap d "_d
xnoremap d "_d
nnoremap <leader>d d
xnoremap <leader>d d
" <leader>p throws away the selected text and pastes the content of the default register
xnoremap <leader>p "_dP
imap <C-v> <Esc>pa
smap <C-v> <C-g>p
cmap <C-v> <C-r>+
" Prevent X from overriding what's in the clipboard
noremap x "_x
noremap <silent> <leader>; :Buffers<CR>
map <Leader> <Plug>(easymotion-prefix)
map <Space> <Leader>
nnoremap <silent> <leader>p :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
" nnoremap <leader>s :ToggleWorkspace<CR>

" PLUGINS
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'sonph/onehalf', { 'rtp': 'vim' } " color scheme
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'thaerkh/vim-workspace'
Plug 'mattn/emmet-vim'
Plug 'preservim/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'ackyshake/VimCompletesMe'
" Plug 'lumiliet/vim-twig'
" Plug 'digitaltoad/vim-pug'
" Plug 'jwalton512/vim-blade'
" Plug 'szw/vim-tags'
call plug#end()

" PLUGIN SETTINGS

" g:tagbar_ctags_bin = '$HOME\vimfiles\plugged\ctags'

" let g:workspace_autosave_ignore = ['gitcommit']

colorscheme onehalflight
" let g:gitgutter_git_executable = 'C:\Windows\Sysnative\wsl.exe'
" let g:gitgutter_git_executable = 'C:/Program Files/Git/bin/git.exe'
" let g:gitgutter_git_executable = '\"C:\Program\ Files\Git\bin\git.exe\"'
let g:workspace_session_name='session.vim'
let g:coc_start_at_startup = v:false " disable CoC
let g:netrw_banner=0 " disable directory banner
let php_htmlInStrings = 1
au BufNewFile,BufRead,BufReadPost *.twig set syntax=html
" autocmd BufNewFile,BufRead *.blade.php set syntax=html
" autocmd BufNewFile,BufRead *.blade.php set filetype=html
" au BufNewFile,BufRead,BufReadPost *.blade.php set syntax=html

let g:ycm_filetype_blacklist = {
            \ 'vim': 1,         
            \ 'lua': 1,
            \ 'json': 1,
            \ 'markdown': 1,
            \ 'md': 1,
            \ }

let $FZF_DEFAULT_OPTS='
      \ --color=fg:#2e3436,bg:#eeeeee,hl:#fcaf3e
      \ --color=fg+:#df5f00,bg+:#000000,hl+:#f57900
      \ --color=info:#afaf87,prompt:#d7005f,pointer:#cc0000
      \ --color=marker:#ef2929,spinner:#af5fff,header:#ffffff'

" use <tab> for trigger completion and navigate to the next complete item
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction
" inoremap <silent><expr> <Tab>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()

let g:airline_theme='onehalfdark'

let g:user_emmet_expandabbr_key='<Tab>' " expand emmet snippet by <tab>

let g:airline#extensions#tagbar#enabled = 1 " enable tagbar in vim airline

set iskeyword+=- "Treat words with dash as a word in Vim
