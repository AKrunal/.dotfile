let g:source_files_list = ['.vimrc','.exrc','init.vim','init.lua']
for x in g:source_files_list
    if !empty(glob(x))
        let s:file = x
        if filereadable(s:file)
            execute 'source' s:file
            execute 'nnoremap <C-x> :edit' s:file '<cr>'
        else
            echo "file does not exist"
        endif
    endif
endfor
