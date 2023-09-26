if g:format_on_save_enabled == 1
  autocmd BufWritePre <buffer> call FormatFile()
endif
