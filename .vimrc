set relativenumber	"Sets numbering to relative
set number		"Displays actual line num at 0

set scrolloff=8		"Sets min scroll buffer to 8
set showcmd
set showmode

syntax on		"Coulors!!!

set autoindent

"Key Mappings
imap jj <Esc>

"Highlight whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
