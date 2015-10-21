""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent
au FileType javascript setl shiftwidth=2
au FileType javascript setl tabstop=2

au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

" run file with NODE CLI (CTRL-M)
au FileType javascript noremap <C-M> :w!<CR>:!node %<CR>

au Filetype javascript vmap <F4> y:vimgrep /<C-R><C-R>"/j **/*.js <bar> cw
au Filetype javascript nmap <F4> byw:vimgrep /<C-R><C-R>"/j **/*.js <bar> cw

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

""""""""""""""""""""""""""""""
" => HTML section
"""""""""""""""""""""""""""""""
au FileType html call HTMLScriptFold()
au FileType html setl fen
au FileType html setl nocindent
au FileType html setl shiftwidth=2
au FileType html setl tabstop=2

function! HTMLScriptFold() 
    setl foldmethod=indent
    setl foldminlines=3
    setl foldlevelstart=1
endfunction


""""""""""""""""""""""""""""""
" => PHP section
"""""""""""""""""""""""""""""""
" run file with PHP CLI (CTRL-M)
:autocmd FileType php noremap <C-M> :w!<CR>:!php %<CR>

" PHP parser check (CTRL-L)
:autocmd FileType php noremap <C-L> :!php -l %<CR>


""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()
