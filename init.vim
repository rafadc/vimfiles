" Autoinstall plug if not there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Theme
Plug 'chriskempson/base16-vim'

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'dense-analysis/ale'

Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" LSP
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Status line
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

" Icons
Plug 'kyazdani42/nvim-web-devicons'

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

execute 'luafile ' . g:nvim_config_root . '/lua/lsp.lua'
execute 'luafile ' . g:nvim_config_root . '/lua/galaxyline_config.lua'

let g:rg_command = 'rg --vimgrep -S'

" Keymaps
nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>

" FZF
nnoremap <silent>ff :GFiles<cr>
nnoremap <silent>fg :Rg<cr>

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Visuals
set bg=dark
colorscheme base16-onedark
set termguicolors
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

" Rust
let g:rustfmt_autosave = 1
