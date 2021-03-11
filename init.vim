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

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" LSP
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" === Programming language support ===

" Ruby
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

let g:nvim_config_root = stdpath('config')
execute 'luafile ' . g:nvim_config_root . '/lua/netrw.lua'

" Keymaps

nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>

" Telescope
nnoremap <silent>ff <cmd>Telescope git_files<cr>
nnoremap <silent>fg <cmd>Telescope live_grep<cr>
nnoremap <silent>fb <cmd>Telescope buffers<cr>
nnoremap <silent>fh <cmd>Telescope help_tags<cr>
nnoremap <silent>fs <cmd>Telescope lsp_workspace_symbols<cr>

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
set clipboard=unnamedplus

" Personal notes file
source ~/.vim/personal_notes.vim
map <silent> <F7> :PersonalNotesToggle<CR>

" Programming language specifics
let g:deoplete#enable_at_startup = 1

nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap gr <cmd>lua vim.lsp.buf.references()<CR>

" Ruby
lua require'lspconfig'.solargraph.setup{}

" Rust
let g:rustfmt_autosave = 1
lua require'lspconfig'.rls.setup{}
