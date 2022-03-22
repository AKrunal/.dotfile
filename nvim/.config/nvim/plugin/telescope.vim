lua require("theprimeagen")

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('theprimeagen.telescope').search_dotfiles({ hidden = true })<CR>

"nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
"nnoremap <leader>va :lua require('theprimeagen.telescope').anime_selector()<CR>
"nnoremap <leader>vc :lua require('theprimeagen.telescope').chat_selector()<CR>
"nnoremap <leader>gc :lua require('theprimeagen.telescope').git_branches()<CR>
"nnoremap <leader>td :lua require('theprimeagen.telescope').dev()<CR>
