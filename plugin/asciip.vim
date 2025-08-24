if exists("g:loaded_ascii_paste")
  finish
endif

let g:loaded_ascii_paste = 1

scriptencoding utf-8

command! -bang -nargs=? -range=-1 -complete=customlist,asciip#CommandComplete Ascii exe asciip#Default(<q-args>)

