au BufRead,BufNewFile *.html.twig set ft=jinja
au BufRead,BufNewFile *.ejs set ft=html

set hls					" hightligh search pattern
set wildmode=longest:full "	Like longest, but also start 'wildmenu' if it is
set go=acet

"changing desert terminal colors
hi Identifier ctermfg=77
hi Comment ctermfg=74
hi Constant ctermfg=174
hi Search ctermfg=101 ctermbg=238

let VCSCommandSVNExec='/usr/bin/svn'
let Tlist_Ctags_Cmd='/usr/bin/ctags'
"let jshint2_command=''
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
let g:used_javascript_libs='underscore,angularjs,angularui,jquery'

"setting vimrc
command! VR :e ~/.vim/vimrcs/my_vimrc.vim
" nnoremap <F4> :execute "vimgrep //gj **/*.js" <bar> cw
" vnoremap <F4> :execute "vimgrep //gj **/*.js" <bar> cw
command GREP :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') | copen

"         let php_folding = 1/2/3  [default 0]
"             ... 1: for folding classes and functions : modified to fold only
"             function
"                 2: for folding all { } regions
"                 TODO: documentation for php_folding_manual
"
let php_folding = 1

:function EXSET(path)
:   execute 'command! EXHOME :cd '.a:path
:   execute 'command! EXCONFIG :cd '.a:path
:   execute 'command! PTAGS :set tags=./tags,'.a:path.'/tags'
:   execute ':map <F11> :!ctags -R --languages=JavaScript -f '.a:path.'/tags '.a:path
:   execute 'command! PTAGS :set tags='.a:path.'/tags,./tags'
:   execute ':cd '.a:path
:   execute ':PTAGS'
:endfunction

:function EX1()
:   execute EXSET('~/Development/js/yofullstack')
:endfunction

:function EX2()
:   execute EXSET('~/Development/js/yofullstackbug')
:endfunction

:function EX3()
:   execute EXSET('~/Development/js/nextyoafs')
:endfunction

:function EXCMU()
:   execute EXSET('~/Development/js/cmufullstack')
:endfunction

:execute EXCMU()

"useful commands 

"autocmd Filetype php :set makeprg=php\ -l\ %
":set errorformat=%m\ in\ %f\ on\ line\ %l

"php setting for omni completion when you hit tab
"au FileType php set omnifunc=phpcomplete#CompletePHP
"let SuperTabDefaultCompletionType='context'

:map <F12> [I:let nr = input("Which one: ") <Bar>exe "normal " . nr ."[\t"<CR>
:map <C-c> "+y<CR>
:map q: <nop>
