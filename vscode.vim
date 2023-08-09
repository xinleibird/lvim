call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'unblevable/quick-scope'
call plug#end()

let g:qs_highlight_on_keys=['f', 'F', 't', 'T']
let mapleader=' '

highlight QuickScopePrimary guifg='#fdfefe' gui=underline ctermfg=231 cterm=underline
highlight QuickScopeSecondary guifg='#707b7c' gui=underline ctermfg=252 cterm=underline

xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

nnoremap <silent> ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
nnoremap <silent> z= <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>

nmap <silent> <leader>lj <Cmd>call VSCodeNotify('editor.action.marker.nextInFiles')<CR>
nmap <silent> <leader>lk <Cmd>call VSCodeNotify('editor.action.marker.prevInFiles')<CR>

nmap <leader>e <Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
