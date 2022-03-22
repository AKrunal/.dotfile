nmap <leader>g :G <CR>
nmap <leader>gc :G commit <CR>
nmap <leader>gp :G push <CR>

vmap <leader>g :G <CR>
vmap <leader>gc :G commit <CR>
vmap <leader>gp :G push <CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gwm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>

let g:gitgutter_max_signs = 500

