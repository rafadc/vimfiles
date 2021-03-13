local lspconfig = require'lspconfig'

lspconfig.solargraph.setup{} -- Ruby
lspconfig.rls.setup{} -- Rust
lspconfig.pyright.setup{} -- Python

require('lspkind').init()

