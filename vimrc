set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" syntax check
Plugin 'w0rp/ale'
" theme
Plugin 'git://github.com/colepeters/spacemacs-theme.vim.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

:set number
" ale begin
let g:ale_linters = {'python' : ['flake8'],}
let g:ale_sign_column_always=1
let g:ale_set_highlights = 0
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

" For a more fancy ale statusline
function! ALEGetError()
  let l:res = ale#statusline#Status()
  if l:res ==# 'OK'
    return ''
  else
    let l:e_w = split(l:res)
    if len(l:e_w) == 2 || match(l:e_w, 'E') > -1
      return ' •' . matchstr(l:e_w[0], '\d\+') .' '
    endif
  endif
endfunction

function! ALEGetWarning()
  let l:res = ale#statusline#Status()
  if l:res ==# 'OK'
    return ''
  else
    let l:e_w = split(l:res)
    if len(l:e_w) == 2
      return ' •' . matchstr(l:e_w[1], '\d\+')
    elseif match(l:e_w, 'W') > -1
      return ' •' . matchstr(l:e_w[0], '\d\+')
    endif
  endif
endfunction

let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'
" ale end

" theme begin
if (has("termguicolors"))
	set termguicolors
endif
set background=dark
colorscheme spacemacs-theme
" theme end

autocmd BufWritePost $MYVIMRC source $MYVIMRC
