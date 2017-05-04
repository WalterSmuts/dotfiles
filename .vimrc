set relativenumber	"Sets numbering to relative
set number		"Displays actual line num at 0

set scrolloff=8		"Sets min scroll buffer to 8
set showcmd
set showmode

syntax on		"Coulors!!!

"Ctags on save
autocmd BufWritePost *.cpp,*.h call system("ctags -R")

"General setup
set nocompatible
syntax enable
filetype plugin on

"Fuzzy file search
set path+=**
set wildmenu

set autoindent

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
