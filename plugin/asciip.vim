if exists("g:loaded_ascii_paste")
  finish
endif

let g:loaded_ascii_paste = 1

scriptencoding utf-8

command! -bang -nargs=? -range=-1 -complete=customlist,asciip#CommandComplete Ascii exe asciip#Default("<mods>", <q-args>)

let s:dir = expand('<sfile>:h:h')
if getftime(s:dir . '/doc/asciip.txt') > getftime(s:dir . '/doc/tags')
  silent! execute 'helptags' fnameescape(s:dir . '/doc')
endif

