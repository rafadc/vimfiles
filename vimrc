" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vifm/vifm.vim'
Plug 'dense-analysis/ale'

" Programming language support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Ruby
Plug 'ngmy/vim-rubocop'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set mouse=a

" Netrw
let g:netrw_banner=0        " disable annoying banner

" Keymaps
noremap <c-t> :FZF .<cr>

nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>

function s:reloadConfig()
	source ~/.vimrc
endfunction
command! ReloadConfig call <SID>reloadConfig()

" Visuals
set bg=dark
colo gruvbox
let g:gruvbox_contrast_dark = 'hard'

set number

set scrolloff=20 " Keep 20 lines always visible

" Tabs to spaces
set softtabstop=4
set tabstop=2
set shiftwidth=8

set expandtab

" Indentation
set autoindent

" Trim triling whitespace
autocmd BufWritePre * %s/\s\+$//e

" Clipboard
set clipboard=unnamed

" Personal notes file
source ~/.vim/personal_notes.vim
map <F7> :PersonalNotesToggle<CR>

" Applications
map <F6> :!tig<CR>
