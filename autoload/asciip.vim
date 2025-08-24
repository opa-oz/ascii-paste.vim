scriptencoding utf-8

let s:commands = {}

function! s:commands.list(opts) abort
  echo "Available ASCII art:"

  let list = asciip#art#List()

  for name in list
    echo name
  endfor
endfunction

let s:commands.ls = s:commands.list

function! s:commands.paste(opts) abort
  if !&modifiable || !&buflisted
    echo "Buffer is not modifiable."
    return
  endif

  let name = asciip#utils#Strip( a:opts['arg'] )
  let index = asciip#art#NameToIndex(name)
  let art = asciip#art#GetByIndex(index)

  let l:current = line('.')
  call append(l:current, art.lines)

  let length = len(art.lines)
  let offset = len(art.lines[length-1])

  call timer_start(0, {-> cursor(l:current+length, offset) })
endfunction


function! asciip#CommandComplete(arg, lead, pos) abort
  let before_cursor = strpart(a:lead, 0, a:pos)
  let args = split(before_cursor)

  call remove(args, 0)
  let num_args = len(args)

  if num_args == 0
    return sort(map(keys(s:commands), { k, v -> tr(v, '_', '-') }))
  elseif num_args == 1 && a:lead[a:pos - 1] !=# ' '
    return sort(filter(map(keys(s:commands), { k, v -> tr(v, '_', '-') }),
          \ { k, v -> strpart(v, 0, len(a:arg)) ==# a:arg }))
  elseif num_args == 1
    return sort(asciip#art#ListNames())
  elseif num_args == 2 && a:lead[a:pos - 1] !=# ' '
    return sort(filter(asciip#art#ListNames(), 'v:val =~ "^" . args[1]')) 
  else
    return []
  endif
endfunction


function! asciip#Default(arg) abort
  let cmd = matchstr(a:arg, '^\%(\\.\|\S\)\+')
  let arg = matchstr(a:arg, '\s\zs\S.*')

  if !empty(cmd) && !has_key(s:commands, tr(cmd, '-', '_'))
    return 'echoerr ' . string('AsciiP: unknown command ' . string(cmd))
  endif

  if empty(cmd)
    " TODO: Do help here   
  endif

  let opts = {'arg':arg}

  call s:commands[tr(cmd, '-', '_')](opts)
endfunction
