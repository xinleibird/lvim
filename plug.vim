call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'unblevable/quick-scope'
call plug#end()

augroup RestoreCursorShapeOnExit
  autocmd!
  autocmd VimLeave * set guicursor= | call chansend(v:stderr, "\x1b[ q")
augroup END
