function! Preserve(command) abort
  " Save the last search.
  let search = @/

  " Save the current cursor position.
  let cursor_position = getpos('.')

  " Save the current window position.
  normal! H
  let window_position = getpos('.')
  call setpos('.', cursor_position)

  " Execute the command.
  execute a:command

  " Restore the last search.
  let @/ = search

  " Restore the previous window position.
  call setpos('.', window_position)
  normal! zt

  " Restore the previous cursor position.
  call setpos('.', cursor_position)
endfunction

" Re-indent the whole buffer.
function! Indent() abort
  call Preserve('normal gg=G')
endfunction

function! Spaces() abort
  call Preserve('silent! %s/\s\+$//e')
endfunction

function! EndLines() abort
  call Preserve('silent! %s#\($\n\s*\)\+\%$##')
endfunction

function FormatFile() abort
  call Spaces()
  call EndLines()
  call Indent()
endfunction
