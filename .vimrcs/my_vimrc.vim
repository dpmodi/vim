au BufRead,BufNewFile *.html.twig set ft=jinja
au BufRead,BufNewFile *.ejs set ft=html

set hls					" hightligh search pattern
set wildmode=longest:full "	Like longest, but also start 'wildmenu' if it is
set go=Pc
set autochdir

if has("gui_running")
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa
endif

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
command! VR :e ~/.vimrcs/my_vimrc.vim
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

:function JSET(path)
:   execute 'command! SFHOME :cd '.a:path
:   execute 'command! PTAGS :set tags='.a:path.'\jtags'
:   execute ':map <C-F11> :!ctags -R --languages=Java -f '.a:path.'/jtags '.a:path
:   execute ':cd '.a:path
:   execute ':PTAGS'
:endfunction

:function SFSET(path)
:   execute 'command! SFHOME :cd '.a:path
:   execute 'command! SFMOD :cd '.a:path.'/apps/rmcc/modules'
:   execute 'command! VMOD :cd '.a:path.'/apps/vanity/modules'
:   execute 'command! SFFORM :cd '.a:path.'/lib/form/doctrine'
:   execute 'command! SFMODEL :cd '.a:path.'/lib/model/doctrine'
:   execute 'command! PTAGS :set tags=./tags,'.a:path.'/tags,~/Dev/lang/php/symfony-1.4.20/sftags'
:   execute ':map <C-F11> :!ctags -R --languages=PHP --exclude=cache -f '.a:path.'/tags '.a:path
:   execute ':cd '.a:path
:   execute ':PTAGS'
:endfunction

:function SF2SET(path)
:   execute 'command! SFHOME :cd '.a:path
:   execute 'command! SFCONFIG :cd '.a:path.'/app/config'
:   execute 'command! SFBB :cd '.a:path.'/src/Bloom/'
:   execute 'command! SFUB :cd '.a:path.'/vendor/friendsofsymfony/user-bundle/FOS/UserBundle'
:   execute 'command! SFXB :cd '.a:path.'/vendor/liuggio/ExcelBundle/Liuggio/ExcelBundle'
:   execute 'command! PTAGS :set tags=./tags,'.a:path.'/tags'
:   execute ':map <C-F11> :!ctags -R --exclude=cache --languages=PHP -f '.a:path.'/tags '.a:path
:   execute ':cd '.a:path
:   execute ':PTAGS'
":   execute ':map <CR> <CR>'
:endfunction


:function EXSET(path)
:   execute 'command! EXHOME :cd '.a:path
:   execute 'command! EXCONFIG :cd '.a:path
:   execute 'command! PTAGS :set tags=./tags,'.a:path.'/tags'
" :   execute ':map <F11> :!ctags -R --languages=JavaScript -f '.a:path.'/tags '.a:path
" :   execute ':map <F11> :!find ' . a:path . ' -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed "/^$/d" | sort > tags'
:   execute 'command! PTAGS :set tags='.a:path.'/tags,./tags'
:   execute ':cd '.a:path
:   execute ':PTAGS'
:   execute ':let $PATH .= ":'.a:path.'/node_modules/.bin"'
:   execute 'let g:syntastic_javascript_eslint_exec = "'.a:path.'/node_modules/.bin/eslint"'
:endfunction

:function EXC()
:   execute EXSET('~/Dev/node/customerportal/trunk')
:endfunction

:function EXC8()
:   execute EXSET('~/Dev/node/node8/ng5customerportal')
:endfunction

:function EXSGIP()
:   execute EXSET('~/Dev/node/node8/sgipreportgen')
:endfunction

:function EXW8()
:   execute EXSET('~/Dev/node/node8/ng5webview')
:endfunction

:function RSK()
:   execute EXSET('~/Dev/node/node8/reactstartkit')
:endfunction

:function GRA()
:   execute EXSET('~/Dev/node/node8/graphqlapi')
:endfunction

:function BGQL()
:   execute EXSET('~/Dev/node/node8/bloomgql')
:endfunction

:execute EXC8()

"useful commands 

"autocmd Filetype php :set makeprg=php\ -l\ %
":set errorformat=%m\ in\ %f\ on\ line\ %l

"php setting for omni completion when you hit tab
"au FileType php set omnifunc=phpcomplete#CompletePHP
"let SuperTabDefaultCompletionType='context'

:function PRETTYJSON()
:   execute ':%!python -m json.tool'
:endfunction

:map <F12> [I:let nr = input("Which one: ") <Bar>exe "normal " . nr ."[\t"<CR>
:map <C-c> "+y<CR>
:map q: <nop>

:command! HFILE :e /etc/hosts
:command! GLOG :e ~/Dev/app/geronimo-tomcat6-javaee5-2.2/var/log/geronimo.log

