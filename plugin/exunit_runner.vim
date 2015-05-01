" exunit_runner.vim - useful commands for running elixir tests
" Maintainer:   Adam Zaninovich
" Version:      0.0.1
"
" Suggested Mappings:
" Run tests on current line. Repeatable outside of test
"   map <leader>t :call exunit_runner#Runline()<cr>
" Run the current test file. Repeatable outside of test
"   map <leader>f :call exunit_runner#Runfile()<cr>
" Run the entire suite of tests
"   map <leader>T :call exunit_runner#Run('test')<cr>
" Repeat whatever was last run
"   map <leader>r :call exunit_runner#Repeat()<cr>
"
" For all of these commands, when run inside a test file,
" they will run that file (and line), when run in a non-
" test file, they will run the last test you ran them in.
"
" There is also a repeat function that will repeat the
" last test you ran in the way that you run it.

command! ExURunAll call exunit_runner#Run('test')
command! ExURunFile call exunit_runner#Runfile()
command! ExURunLine call exunit_runner#Runline()
command! ExURepeat call exunit_runner#Repeat()

