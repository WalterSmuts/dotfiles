set relativenumber	"Sets numbering to relative
set number		"Displays actual line num at 0

set scrolloff=8		"Sets min scroll buffer to 8
set showcmd
set showmode

set enc=utf-8

"Pathogen Support
execute pathogen#infect()

"Coulors!!!
syntax on

"Syntanstic to follow
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options = ' -std=c++11 `sdl2-config --cflags --libs`'

"Ctags on save
autocmd BufWritePost *.cpp,*.h call system("ctags -R")

"General setup
set nocompatible
syntax enable
filetype plugin on

"Fuzzy file search
set path+=**
set wildmenu

"Key Mappings
imap jj <Esc>
inoremap <Nul> <C-n>

"Highlight whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"Powerline
let g:powerline_pycmd="py3"
set laststatus=2
set t_Co=256

"STOP USING ARROWS!
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
