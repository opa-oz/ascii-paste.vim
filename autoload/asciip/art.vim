scriptencoding utf-8

let s:current_file = expand('<sfile>:p')
let s:asciip_dir = fnamemodify(s:current_file, ':h')  
let s:plugin_dir = fnamemodify(s:asciip_dir . '/../../plugin', ':p')

let s:folder = s:plugin_dir . '/arts'


let s:art = [
  \ {
      \ "name": "cat",
      \ "shortDesc": "A cute cat face.",
      \ "length": 3,
      \ "art": "cat.txt",
  \ },
  \ {
      \ "name": "rocket",
      \ "shortDesc": "A minimalist rocket blasting off.",
      \ "length": 10,
      \ "art": "rocket.txt",
  \ },
  \ {
      \ "name": "coffee_cup",
      \ "shortDesc": "A cup of hot coffee.",
      \ "length": 6,
      \ "art": "coffee_cup.txt",
  \ },
  \ {
      \ "name": "simple_footer",
      \ "shortDesc": "A minimal footer divider.",
      \ "length": 3,
      \ "art": "simple_footer.txt",
  \ },
  \ {
      \ "name": "curvy_divider",
      \ "shortDesc": "Decorative curvy line, good for section separation.",
      \ "length": 1,
      \ "art": "curvy_divider.txt",
  \ },
\ ]

let s:artDict = {}
let s:i = 0
for art in s:art
  let s:artDict[art.name] = s:i
  let s:i += 1
endfor

function! asciip#art#List(...) abort
  return sort(mapnew(s:art, {k,v -> ' ' . string(k+1) . '. ' . v.name . ' (' . v.shortDesc . ')'} ))
endfunction

function! asciip#art#ListNames(...) abort
  return sort(mapnew(s:art, {k,v -> v.name } ))
endfunction

function! asciip#art#NameToIndex(name) abort
  if !has_key(s:artDict, a:name)
    echoerr 'AsciiP: Art with name "' . a:name . '" not found.'
  endif

   return s:artDict[a:name]
endfunction

function! asciip#art#LoadOrNot(index) abort
  let art = s:art[a:index]
  let fname = s:folder . '/' . art.art

  if has_key(art, "lines")
    return
  endif

  let art.lines = []
  for line in readfile(fname, '', art.length)
    call add(art.lines, line)
	endfor
endfunction

function! asciip#art#GetByIndex(index) abort
  call asciip#art#LoadOrNot(a:index)

  return s:art[a:index]
endfunction
