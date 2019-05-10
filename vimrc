" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Ruby
Plug 'ngmy/vim-rubocop'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set mouse=a

" Netrw
let g:netrw_banner=0        " disable annoying banner

" Keymaps
inoremap jj <ESC>
nnoremap jj <ESC>
nnoremap <c-t> :FZF .<cr>

nnoremap <C-j> :bprev<CR>                                                                            
nnoremap <C-k> :bnext<CR>

function ReloadConfig()
	source ~/.vimrc
endfunction

" Visuals
colo gruvbox
let g:gruvbox_contrast_dark = 'hard'

set number