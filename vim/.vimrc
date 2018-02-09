execute pathogen#infect()
set nocompatible
filetype on
filetype indent on
filetype plugin on

let mapleader = ","
"Syntax highlighting enables Vim to show parts of the text in another font or color
syntax on

set cindent
"set smartindent
"Number of spaces that a <Tab> in the file counts for
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set textwidth=900
"Show the line and column number of the cursor position, separated by a comma
set ruler
"While typing a search command, show where the pattern, as it was typed
se incsearch
se hlsearch
set smartcase
set gdefault
"Ignore case in search patterns
se ic
"Line numbers
set number
set nobackup
set nowb
set noswapfile
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set wildmenu
set wildmode=full
set colorcolumn=80
set synmaxcol=80
set nowrap
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

"vypne foldovani pri startu
set nofoldenable
set autochdir
set background=dark
"mouse support
"set mouse=a
if has('gui_running')
  set lines=999 columns=999
  colorscheme solarized
  set mousemodel=popup
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  if !has("unix")
    set guifont=Courier_New:h10:cEASTEUROPE
  endif
else
  colorscheme delek
endif

set cursorline
hi CursorLineNr term=bold cterm=bold ctermfg=3 gui=bold guifg=Gray
hi CursorLine term=NONE cterm=NONE

" presune obsah schranky do * registru
" set clipboard=unnamed

"mapovani
" Surround info:
" surround yss obali aktualini lajnu
" vyber lajny pres virtual a nasledne S obali lajnu a tagy jsou nad i pod odstraneni tagu dst
" cs<znacka stara> a pak <znacka nova> zmeni obalovaci znacku

"'p' to paste, 'gv' to re-select what was originally selected. 'y' to copy it again.
" xnoremap p pgvy

" gvim pastuje z registru *, coz se mi nelibi
" nnoremap p "0p
" nnoremap P "0P

vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

cabbrev ve vsp

" nnoremap <leader>f zi<cr>
nnoremap <leader>w :lw 6<cr>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>i gg=G''<cr>
nnoremap <leader>v <C-W>v
nnoremap <leader>o <C-W>x
nnoremap <leader>t <C-W>s
nnoremap <leader>q <C-W>c
nnoremap <leader>l <C-W>l
nnoremap <leader>h <C-W>h
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>b :bd<cr>
nnoremap <leader>p :TlistToggle<cr>
" CTRL-C and CTRL-Insert are Copy
" vnoremap <C-C> "+y
" CTRL-V and SHIFT-Insert are Paste
" map <C-V>		"+gP
" cmap <C-V>		<C-R>+
noremap <leader>s :wa<CR>

" switch between hpp/cpp
nnoremap <F2> :FSHere<cr>
nnoremap <leader><F2> :FSLeft<cr>
nnoremap <leader><F3> :FSRight<cr>

" ack
function! RunAck(arg)
  if exists("g:project_dir")
    call ack#Ack('grep ' . a:arg, g:project_dir)
  else
    call ack#Ack('grep ' . a:arg, '.')
  endif
endfunction

nnoremap <F3> :call RunAck("")<left><left>
let g:lt_location_list_toggle_map = '<F4>'
let g:lt_quickfix_list_toggle_map = '<S-F4>'
let g:lt_height = 5

map <leader>m <plug>NERDCommenterToggle
let g:NERDSpaceDelims = 1

"clang-format
let g:clang_format#code_style='WebKit'
nnoremap <leader>f :ClangFormat<cr>
let g:clang_format#style_options = {
            \ "SortIncludes" : "false"}

"Doxygen
nnoremap <leader>d :Dox<cr>

"pydocstring
let g:pydocstring_enable_mapping = 0

"syntastic
let g:syntastic_mode_map = { 'mode': 'active'}
let g:syntastic_loc_list_height = 5
let g:syntastic_error_symbol='E'
let g:syntastic_warning_symbol='W'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" these are too verbose
let g:syntastic_python_checkers = ["flake8", "python", "pyflakes"]
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_nasm_nasm_args = "-f elf64"
let g:syntastic_cpp_compiler_options = "-std=gnu++11"
map <leader>a :SyntasticCheck<cr>

"CtrlP
" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'
nnoremap <C-l> :CtrlPBuffer<CR>
nnoremap <C-k> :CtrlPMRU<CR>

"NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

"Arduino/VIM hardy
let g:hardy_split_direction=1
let g:hardy_window_size=10

"autopep8
let g:autopep8_disable_show_diff=0

" remote trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

augroup vimscript
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

augroup shell
  autocmd!
  autocmd BufEnter *.sh inoremap <buffer> <F5> <esc>:w<cr>:!bash %<cr>
  autocmd BufEnter *.sh nnoremap <buffer> <F5> :w<cr>:!bash %<cr>
augroup END

augroup javascript
  autocmd!
  autocmd BufEnter *.js nnoremap <buffer> <leader>f :Autoformat<cr>
augroup END

augroup matlab
  autocmd!
  autocmd BufEnter *.m inoremap <buffer> <F5> <esc>:w<cr>:!octave -q %<cr>
  autocmd BufEnter *.m nnoremap <buffer> <F5> :w<cr>:!octave -q %<cr>
augroup END

augroup gnuplot
  autocmd!
  autocmd BufEnter *.plt inoremap <buffer> <F5> <esc>:w<cr>:!gnuplot %<cr>
  autocmd BufEnter *.plt nnoremap <buffer> <F5> :w<cr>:!gnuplot %<cr>
augroup END

augroup html
  autocmd!
  autocmd BufEnter *.htm? inoremap <buffer> <F5> <esc>:w<cr>:!chrome %:p<cr>
  autocmd BufEnter *.htm? nnoremap <buffer> <F5> :w<cr>:!chrome %:p<cr>
  autocmd BufEnter *.htm? nnoremap <buffer> <leader>f :Autoformat<cr>
  " pro babel v jinje
  autocmd BufEnter *.htm? vnoremap b <Esc>`>a') }}<Esc>`<i{{ _('<Esc>
  " autocmd BufNew,BufNewFile,BufRead *.html :set filetype=htmljinja
  autocmd BufNew,BufNewFile,BufRead *.html :set syntax=htmljinja
augroup END

augroup python
  autocmd!
  autocmd BufEnter *.py inoremap <buffer> <F5> <esc>:w<cr>:!/sw/bin/py2 %<cr>
  autocmd BufEnter *.py nnoremap <buffer> <F5> :w<cr>:!/sw/bin/py2  %<cr>
  autocmd BufEnter *.py inoremap <buffer> <F6> <esc>:w<cr>:!/sw/bin/py3 %<cr>
  autocmd BufEnter *.py nnoremap <buffer> <F6> :w<cr>:!/sw/bin/py3  %<cr>
  autocmd BufEnter *.py inoremap <buffer> <F7> <esc>:w<cr>:!python %<cr>
  autocmd BufEnter *.py nnoremap <buffer> <F7> :w<cr>:!python  %<cr>
  autocmd BufEnter *.py setlocal shiftwidth=4 softtabstop=4 tabstop=4
  autocmd BufEnter *.py setlocal ft=python
  autocmd BufEnter *.py setlocal textwidth=80
  autocmd BufEnter *.py iabbrev <buffer> ana #!/sw/bin/py2
  autocmd BufEnter *.py nnoremap <buffer> <leader>8 :Autopep8<cr>:SyntasticCheck<cr>
  autocmd BufEnter *.py nmap <silent> <leader>d <Plug>(pydocstring)
augroup END

augroup tex
  autocmd!
  autocmd BufEnter *.tex iabbrev <buffer> \( \left(
  autocmd BufEnter *.tex iabbrev <buffer> \) \right)
  autocmd BufEnter *.tex inoremap <buffer> _ _{}<left>
  autocmd BufEnter *.tex inoremap <buffer> ^ ^{}<left>
  autocmd BufEnter *.tex inoremap <buffer> <F5> <esc>:w<cr>:!pdflatex --shell-escape %<cr>
  autocmd BufEnter *.tex nnoremap <buffer> <F5> <esc>:w<cr>:!pdflatex --shell-escape %<cr>
augroup END

augroup perl
  autocmd!
  autocmd BufEnter *.pl inoremap <buffer> <F5> <esc>:w<cr>:!perl %<cr>
  autocmd BufEnter *.pl nnoremap <buffer> <F5> :w<cr>:!perl  %<cr>
  autocmd BufEnter *.pl,*.pm,*.cse setlocal shiftwidth=2 softtabstop=2 tabstop=2
augroup END

augroup arduino
  autocmd!
  autocmd BufEnter *.ino,*.pde inoremap <buffer> <F5> <esc>:w<cr>:ArduinoVerify<cr>
  autocmd BufEnter *.ino,*.pde nnoremap <buffer> <F5> :w<cr>:ArduinoVerify<cr>
  autocmd BufEnter *.ino,*.pde inoremap <buffer> <F6> <esc>:w<cr>:ArduinoUpload<cr>
  autocmd BufEnter *.ino,*.pde nnoremap <buffer> <F6> :w<cr>:ArduinoUpload<cr>
augroup END

augroup cse
  autocmd!
  autocmd BufEnter *.cse setlocal ft=perl
augroup END

augroup asm
  autocmd!
  autocmd BufEnter *.asm setlocal ft=nasm
augroup END

if filereadable("_myvimrc")
    source _myvimrc
endif
