# exunit_runner.vim

Runs exunit tests in vim

## Installation

### Pathogen installation

    cd ~/.vim/bundle
    git clone git://github.com/adamzaninovich/vim-exunit_runner.git

### Vundle installation

In your vimrc:

    Plugin 'adamzaninovich/vim-exunit_runner'

## Usage

For all of the commands, when run inside a test file, they will run that file (and/or line). When run in a non-test file, they will run command as you ran it last time you were in a test file. There is also a repeat function that will repeat the last test you ran in the way that you ran it.

## Suggested Mappings:

Run tests on current line. Repeatable outside of test

    autocmd FileType elixir map <buffer> <leader>t :call exunit_runner#Runline()<cr>

Run the current test file. Repeatable outside of test

    autocmd FileType elixir map <buffer> <leader>f :call exunit_runner#Runfile()<cr>

Run the entire suite of tests

    autocmd FileType elixir map <buffer> <leader>T :call exunit_runner#Run('test')<cr>

Repeat whatever was last run

    autocmd FileType elixir map <buffer> <leader>r :call exunit_runner#Repeat()<cr>
