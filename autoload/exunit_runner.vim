" Utility functions

function! s:setfile()
  let s:file = @%
endfunction

function! s:setline()
  let s:line = line('.')
endfunction

function! s:in_test_file()
  return match(expand("%"), '_test.exs$') != -1
endfunction

function! s:get_suffix(list_of_args)
  if len(a:list_of_args) == 1
    return a:list_of_args[0]
  else
    if exists("s:line")
      unlet s:line
    endif
  endif
  return ""
endfunction

" Running Tests

function! exunit_runner#Run(filename)
  :w
  :silent !echo;echo;echo;echo;echo
  exec ":!mix test ".a:filename
endfunction

function! exunit_runner#Runfile(...)
  if s:in_test_file()
    call s:setfile()
  elseif !exists("s:file")
    echoerr "File not available: ".s:file
    return
  end
  call exunit_runner#Run(s:file.s:get_suffix(a:000))
endfunction

function! exunit_runner#Runline()
  if s:in_test_file()
    call s:setline()
  elseif !exists("s:line")
    echoerr "Cannot find line: ".s:file.":".s:line
    return
  end
  call exunit_runner#Runfile(":".s:line)
endfunction

function! exunit_runner#Repeat()
  if exists("s:file")
    if exists("s:line")
      call exunit_runner#Run(s:file.":".s:line)
    else
      call exunit_runner#Run(s:file)
    endif
  else
    echoerr "Nothing to repeat"
  endif
endfunction
