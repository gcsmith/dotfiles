set nocompatible
filetype off

" ------------------------------------------------------------------------------
" configure vundle plugin manager
" ------------------------------------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/mayansmoke'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/verilog_systemverilog.vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'vim-scripts/Mark--Karkat'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" ------------------------------------------------------------------------------
" configure display options
" ------------------------------------------------------------------------------

if has("syntax") && (&t_Co > 2)
    syntax on
endif

set background=light
let g:solarized_termcolors=256

set colorcolumn=81,161,241
highlight ColorColumn ctermbg=darkgray guibg=black

" disable just about everything in gVim and override the default font
if has("gui_running")
    set guifont=Powerline\ Consolas\ 9
    set guioptions-=M
    set guioptions-=m
    set guioptions-=L
    set guioptions-=l
    set guioptions-=R
    set guioptions-=r
    set guioptions-=T
    set guioptions+=c
    set cul
    colorscheme solarized
else
    set t_Co=256
    colorscheme solarized
endif

" use a more subtle color scheme when diffing files
if &diff
    colorscheme mayansmoke
endif

set cursorline
set nowrap
set ruler
set number
set hlsearch
set ignorecase
set showcmd
set shortmess=atIToO
set scrolloff=4
set title
set wildmenu
"set cinoptions=:0,g0

" always expand tabs and indentations to four spaces, limit to 80 characters
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" set textwidth=80

" enable and configure syntax folding
if has("folding")
    set foldmethod=syntax
    set foldenable
    set foldlevel=1000
    set foldcolumn=1
endif

set spelllang=en_us
set tags+=~/.vim/systags
set backupdir=~/.vim/backup

" ------------------------------------------------------------------------------
"  configure custom commands
" ------------------------------------------------------------------------------

" define EMake: invoke make but do not jump to first error, toggle quickfix
:com -nargs=* EMake make! <args> | cwindow 10
:autocmd! FileType qf wincmd J

" map custom shortcut commands to the T key
map tn :tabnew<CR>
map tw :tabnext<CR>
map tb :tabprev<CR>
map tc :tabclose<CR>
map t1 :tabnext 1<CR>
map t2 :tabnext 2<CR>
map t3 :tabnext 3<CR>
map t4 :tabnext 4<CR>
map t5 :tabnext 5<CR>
map t6 :tabnext 6<CR>
map t7 :tabnext 7<CR>
map t8 :tabnext 8<CR>
map t9 :tabnext 9<CR>
map ts :!bash<CR>
map tm :EMake<CR>
map te :copen<CR>
map th :set invhlsearch<CR>

" process binary files (*.bin) through xxd for hex editing
augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END

" ------------------------------------------------------------------------------
" configure plugin: YouCompleteMe
" ------------------------------------------------------------------------------

let g:ycm_confirm_extra_conf = 0

" ------------------------------------------------------------------------------
" configure plugin: airline
" ------------------------------------------------------------------------------

let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1

" ------------------------------------------------------------------------------
" configure plugin: NERDtree
" ------------------------------------------------------------------------------

let g:NERDTreeWinSize = 58
let g:NERDTreeWinPos = "right"
map tt :NERDTreeToggle<CR>

" ------------------------------------------------------------------------------
" configure plugin: taglist
" ------------------------------------------------------------------------------

let Tlist_Ctags_Cmd='ctags'
let Tlist_WinWidth = 40
let Tlist_Use_Right_Window = 1
map tl :TlistToggle<CR>

" ------------------------------------------------------------------------------
" configure plugin: vimsh
" ------------------------------------------------------------------------------

let g:vimsh_pty_prompt_override = 0
let g:vimsh_sh = '/bin/bash'
let g:vimsh_split_open = 1

" ------------------------------------------------------------------------------
" configure plugin: omni-cpp-complete
" ------------------------------------------------------------------------------

let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0

