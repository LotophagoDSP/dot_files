




" => General

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8
set encoding=utf-8
" load plugins from vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree' " file drawer, open with :NERDTreeToggle
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
"Plugin 'scrooloose/nerdcommenter'

call vundle#end()
filetype plugin indent on

"use tab for snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:snips_author="jkrohn"

let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["~/.vim/bundle/vim-snippets/UltiSnips/","UltiSnips"]
"let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']


set nocompatible " not compatible with vi
set autoread " detect when a file is changed
set backspace=indent,eol,start
set viminfo=
syntax on

set showmatch
set expandtab " tab will beconverted to blank spaces difeined with with set ts
set ts=2
set sts=2
set sw=2
set number
set shiftround " round indent to a multiple of 'shiftwidth'
set ttyfast
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink
" KILL ERROR BELL
set noerrorbells visualbell t_vb=

set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
let g:solarized_visibility='high'
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
"colorscheme molokai
colorscheme apprentice
"colorscheme solarized
"set number
"set ruler
set cursorline
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"set number relativenumber

set laststatus=2 " show the satus line all the time

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>



"autocmd InsertEnter * set paste
"autocmd InsertLeave * set paste
" set ruler in insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

""let mapleader = "-"

"intend guides
set autowrite
set list 
"set listchars=tab:\|\ "",space:\_\  ""whitespace hier  
set listchars=trail:-,tab:\|\  "",space:_ 
"set listchars=space:.
"set listchars=trail:· ""hier muss ein space hinter!
"set listchars=precedes:.
"set list lcs=tab:\|\ ""hier muss ein space hinter!
    1
    2
    3
    "whitespace
      
""nnoremap    <F9>:w<CR>:!fixstyle expand('%:t') && :!scons -D<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" variables
let b2sourced=$B2SOURCED
" set paste, no paste so dass man vernuenftig copy und pasten kann
set pastetoggle=<F2>
function! InstallPackage()
  exe "!pip3 install . --upgrade"
endfunction
nmap <F3> :call InstallPackage()<return>

function! SconsD()
  exe "w"
    if expand("%:e") == "cc"
        exe "!fixstyle" fnameescape(expand("%:p:r:s?src?include?").".h")
        exe "!fixstyle" expand('%:p')
    elseif expand("%:e") == "h"
        exe "!fixstyle" fnameescape(expand("%:p:r:s?include?src?").".cc")
        exe "!fixstyle" expand('%:p')
    endif
  exe "!scons -D"
endfunction
nnoremap <F9> :call SconsD()<return>

"" oefne cpp header mit ,o in neuem split
function! OpenOther()
    if expand("%:e") == "cc"
        exe "vsplit" fnameescape(expand("%:p:r:s?src?include?").".h")
    elseif expand("%:e") == "h"
        exe "vsplit" fnameescape(expand("%:p:r:s?include?src?").".cc")
    endif
endfunction
nmap ,o :call OpenOther()<CR>


"" mach nerdtree neben dem momentanen file auf
"" :echo expand('%:t')  file mit endung
"" :echo expand('%:p')  ganzer pfad
"" :echo expand('%:p:h') dir in der file liegt
function! OpenNerdTreeInNewTab()
  exe "tabnew" fnameescape(expand('%:p:h'))
endfunction
nnoremap <F8> :call OpenNerdTreeInNewTab() <return>

"" fuehre filename mit root aus
"" wenn das framework gesourced ist ...
function! ExecuteWithRoot()
""  if $B2SOURCED == 1 
    exe ":!root" fnameescape(expand('%:p'))
""  else
""    call StartBelle2()
""    exe ":!root" fnameescape(expand('%:p'))
""  endif
endfunction
nnoremap <F7> :call ExecuteWithRoot() <CR>

"" fuehre filename mit root aus
function! ExecuteWithBASF2()
  exe ":!basf2" fnameescape(expand('%:p'))
endfunction
nnoremap <F6> :call ExecuteWithBASF2() <CR>

"" fuehre filename mit root aus
function! ExecuteWithPy3()
  exe ":!python3" fnameescape(expand('%:p'))
endfunction
nnoremap <F5> :call ExecuteWithPy3() <CR>




function! StartBelle2()
  exe ":!source /nfs/dust/belle2/user/jkrohn/belle2/tools/setup_belle2"
  exe ":!zsh /nfs/dust/belle2/user/jkrohn/belle2/release/setuprel"
  let $B2SOURCED=1
endfunction





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 let g:airline#extensions#tabline#enabled = 1



" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

" map fuzzyfinder (CtrlP) plugin
" nmap <silent> <leader>t :CtrlP<cr>
nmap <silent> <leader>r :CtrlPBuffer<cr>
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'

" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$'
            \ }

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2


