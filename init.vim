" Autoinstall plug if not there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'
Plug 'vimwiki/vimwiki'
Plug 'kevinhwang91/rnvimr'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" === Programming language support ===

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'ngmy/vim-rubocop'

" Elixir
Plug 'elixir-editors/vim-elixir'

" Rust
Plug 'rust-lang/rust.vim'

" GraphQL
Plug 'jparise/vim-graphql'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let mapleader = "\<Space>"

set mouse=a

" Netrw
let g:netrw_banner=0        " disable annoying banner

" Rnvimr
let g:rnvimr_enable_ex = 1  " Ranger will replace netrw

let g:rnvimr_presets = [{'width': 0.950, 'height': 0.950}]

highlight link RnvimrNormal CursorLine

nnoremap <silent> <C-Space> :RnvimrToggle<CR>

" Keymaps

nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>

function s:reloadConfig()
	source ~/.config/nvim/init.vim
endfunction
command! ReloadConfig call <SID>reloadConfig()

function s:settings()
	e ~/.config/nvim/init.vim
endfunction
command! Settings call <SID>settings()

" Telescope
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope lsp_workspace_symbols<cr>

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
autocmd BufWritePre * :%s/\s+$//e " Remove trailing whitespace

set expandtab

" Indentation
set autoindent

" Trim triling whitespace
autocmd BufWritePre * %s/\s\+$//e

" Clipboard
set clipboard=unnamedplus

" Personal notes file
source ~/.vim/personal_notes.vim
map <silent> <F7> :PersonalNotesToggle<CR>

" CoC

let g:coc_global_extensions = ['coc-json', 'coc-html', 'coc-solargraph', 'coc-rls']

" Rust
let g:rustfmt_autosave = 1
