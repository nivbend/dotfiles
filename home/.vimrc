" Start pathogen.
execute pathogen#infect()
filetype plugin indent on

syntax enable

" Set colorscheme.
set t_Co=256
colorscheme molokai
set background=dark

" General settings.
set nocompatible
set encoding=utf-8
set history=1000
set laststatus=2
set showcmd
set ruler
set backspace=indent,eol,start
set scrolloff=1
set noswapfile

" Show relative line numbers and current line number.
set relativenumber
set number

" Restore last position when openning file.
autocmd BufWinLeave * mkview
autocmd VimEnter * silent loadview

" Define tabs' sizes and expension.
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4

" Turn off tab expension in makefiles.
autocmd FileType make setlocal noexpandtab

" Fix block indentation in visual mode.
" By default, indentation exits visual mode; this returns
" to the previously selected block.
vmap > >gv
vmap < <gv

" Case-insensitive file and directory lookup.
set wildignorecase
set wildignore=*~,*.o,*.a,*.pyc,*.pyo

" Search settings.
set incsearch
set ignorecase
set smartcase
set hlsearch
set gdefault

" Enforce maximum line length.
set textwidth=80
set colorcolumn=+1
set nowrap
set formatoptions=croqn1j

" Indentation.
set autoindent
set smartindent
set cindent

" Highlight trailing spaces.
highlight TrailingSpaces ctermbg=red
match TrailingSpaces /\s\+$/

" Command to remove trailing spaces.
noremap <Leader>rts :%s/\s\+$//<CR>

" Don't redraw while executing macros.
set lazyredraw

" Show matching brackets when cursor is over one.
set showmatch

" Make Y behave like C and D.
nmap Y y$

" Disable the arrow keys.
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Make j/k move by visual lines and not file lines.
nnoremap j gj
nnoremap k gk

" Add blank lines below/above with <Leader>j/k.
nmap <Leader>j mzo<Esc>`z
nmap <Leader>k mzO<Esc>`z

" Move lines around using Ctrl-<movement>.
nmap <C-j> mz:m+1<CR>`z
nmap <C-k> mz:m-2<CR>`z
nmap <C-l> mz>>`z4l
nmap <C-h> mz<<`z4h
vmap <C-j> :m'>+1<CR>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<CR>`>my`<mzgv`yo`z

" Persistent undo history between session.
set undodir=~/.vim/undo
set undolevels=1000
set undoreload=10000
set undofile

" Configure indent-guides to match colorscheme.
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235 guibg=red
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234 guibg=green

" Toggle taglist window.
nmap <Leader>t :TlistToggle<CR>

" Set clang_complete options.
let g:clang_library_path = '/usr/lib/llvm-3.2/lib/'
let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1

" Source local vim configuration.
try
    source $HOME/.vimrc.local
catch
    " Ignore missing file.
endtry
