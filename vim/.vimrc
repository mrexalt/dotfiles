syntax on
set background=dark
set ts=4
set sw=4
set sts=0    
set ai
set noet nomodeline
set backup
set backupdir=~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.tmp,~/tmp,/var/tmp,/tmp
set dictionary+=/usr/share/dict/words

set hlsearch
set incsearch
set ruler
set showcmd
set title
set wildmenu
set wildmode=list,longest

set backup
set backupdir=~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.tmp,~/tmp,/var/tmp,/tmp

set backspace=indent,eol,start
set history=200

set fileencodings=ucs-bom,utf8,cp936,gbk,big5,euc-jp,euc-kr,gb18130,latin1

set laststatus=2
"set statusline=%<[%{getcwd()}]\ %f\ %y%h%w%m%r%=[0x%02B]\ [%l,%c]\ [%o]\ -\ [%p%%]

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

" Formats the statusline
set statusline=%f                           " file name
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=[%b][0x%B]              " ASCII and byte code under cursor
set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number

if has("gui_running")
  set cursorcolumn
  set cursorline
  set nowrap
  set relativenumber
  set spell

  " Ctrl-F12 Toggle Menubar and Toolbar
  nmap <silent> <C-F12> :
    \ if &guioptions =~# 'T' <Bar>
      \ set guioptions-=T <Bar>
      \ set guioptions-=m <Bar>
    \ else <Bar>
      \ set guioptions+=T <Bar>
      \ set guioptions+=m <Bar>
    \ endif<CR>

  set guioptions-=T
  set guioptions-=m
endif
