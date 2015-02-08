function! Yank2Remote() range
    let tmp = @@
    silent normal gvy
    let selected = @@
    let @@ = tmp
    echo selected
    let s:params = ['echo -n "%s" > $HOME/clip', selected]
    let s:ret = system(call(function('printf'), s:params))
endfunction
command! -range Yank2Remote :<line1>,<line2>call Yank2Remote()
vmap <silent> ,y :Yank2Remote<CR>
