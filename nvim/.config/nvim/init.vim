""" Optixal's Neovim Init.vim

""" Vim-Plug
call plug#begin()"{{{
"some random plugin
Plug 'sbdchd/neoformat'
Plug 'mbbill/undotree'
Plug 'https://github.com/luisiacc/gruvbox-baby.git'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'theprimeagen/vim-be-good'
Plug 'https://github.com/ThePrimeagen/refactoring.nvim.git'

Plug 'https://github.com/nvim-treesitter/nvim-treesitter.git'
"git worktree
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

Plug 'https://github.com/preservim/nerdtree.git'

Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'nvim-lua/plenary.nvim' " don't forget to add this one if you don't have it yet!
Plug 'ThePrimeagen/harpoon'
Plug 'https://github.com/morhetz/gruvbox.git'

Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gcg

" telescopes plugin
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'https://github.com/nvim-telescope/telescope-fzy-native.nvim.git'

" Aesthetics - Main
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bryanmylee/vim-colorscheme-icons'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'zaki/zazen'
Plug 'szw/vim-maximizer'


" Functionalities
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-abolish'
Plug 'Yggdroot/indentLine' " no fuckign idea what the hell is going hear
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
Plug 'metakirby5/codi.vim'
Plug 'dkarter/bullets.vim'
Plug 'psliwka/vim-smoothie'
Plug 'antoinemadec/FixCursorHold.nvim'

call plug#end()"}}}

" Main Coloring Configurations
syntax on
"colorscheme gruvbox

" Enable True Color Support (ensure you're using a 256-color enabled $TERM, e.g. xterm-256color)
set termguicolors

""" Plugin Configurations


" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''
"let g:airline#extensions#tabline#enabled = 1 " Uncomment to display buffer tabline above

" Neovim :Terminal
"tmap <Esc> <C-\><C-n>
"tmap <C-w> <Esc><C-w>
"tmap <C-d> <Esc>:q<CR>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" vim-pydocstring
let g:pydocstring_doq_path = '~/.config/nvim/env/bin/doq'

" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_defaultGroup = 'NonText'
" Disable indentLine from concealing json and markdown syntax (e.g. ```)
let g:vim_json_syntax_conceal = 0

" TagBar
let g:tagbar_width = 30

" fzf-vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Constant'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Bat theme for syntax coloring when viewing files in fzf
let $BAT_THEME='base16'

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = 'gray'

" Startify
let g:startify_fortune_use_unicode = 1


" coc.vim START{{{

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" coc.vim END}}}

" signify
let g:signify_sign_add = '│'
let g:signify_sign_delete = '│'
let g:signify_sign_change = '│'
hi DiffDelete guifg=#ff5555 guibg=none

" FixCursorHold for better performance
let g:cursorhold_updatetime = 100

" context.vim
let g:context_nvim_no_redraw =1

""" Filetype-Specific Configurations

" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

""" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

" Dracula Mode (Dark)
function! ColorDracula()
    let g:airline_theme='dracula'
    color dracula
endfunction

" Seoul256 Mode (Dark & Light)
function! ColorGruv()
    :colorscheme gruvbox-baby
    :AirlineTheme google_dark
endfunction

""" Custom Mappings"{{{

let mapleader=" "
nmap <leader>$s <C-w>s<C-w>j:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>q :NERDTreeToggle<CR>
nmap \\ <leader>q
nmap <leader>$v <C-w>v<C-w>l:terminal<CR>:set nonumber<CR><S-a>
nmap \\ <leader>q
nmap <leader>w :TagbarToggle<CR>
nmap \| <leader>w
nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme
nmap <leader>e1 :call ColorDracula()<CR>
nmap <leader>e2 :call ColorGruv()<CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>
nmap <leader>p <Plug>(pydocstring)
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader>s :Rg<CR>
nmap <leader>d  <cmd>lua require('telescope.builtin').find_files()<CR>
nmap <leader>f :BLines<CR>
nmap <leader>h :RainbowParentheses!!<CR>
nmap <leader>j :set filetype=journal<CR>
nmap <leader>k :ColorToggle<CR>
nmap <leader>l :Limelight!!<CR>
xmap <leader>l :Limelight!!<CR>
autocmd FileType python nmap <leader>x :0,$!~/.config/nvim/env/bin/python -m yapf<CR>
nmap <silent> <leader><leader> :noh<CR>



autocmd FileType apache setlocal commentstring=#\ %s
inoremap <C-t> <Esc>:tabnew<CR>==gi
nnoremap <C-t> :tabnew<CR>==
vnoremap <C-t> :tabnew<CR>gv=gv

let g:gitgutter_max_signs = 500

inoremap <C-TAB> <Esc>:tabnext<CR>==gi
nnoremap <C-TAB> :tabnext<CR>==
vnoremap <C-TAB> :tabnext<CR>gv=gv

""" Custom Mappings
let mapleader=" "
nmap <leader>ts <C-w>s<C-w>j:terminal<CR>:set nonumber<CR><S-a>
nmap <leader>w :TagbarToggle<CR>
nmap \| <leader>w
nmap <leader>ee :Colors<CR>
nmap <leader>ea :AirlineTheme
nmap <leader>e1 :call ColorDracula()<CR>
nmap <leader>e2 :call ColorGruv()<CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>t :call TrimWhitespace()<CR>
nmap <leader>p <Plug>(pydocstring)
xmap <leader>a gaip*
nmap <leader>a gaip*
nmap <leader>s :Rg<CR>
nmap <C-p>  <cmd>lua require('telescope.builtin').find_files()<CR>
nmap <leader>f :BLines<CR>
nmap <leader>j :set filetype=journal<CR>
nmap <leader>k :ColorToggle<CR>
nmap <leader>l :Limelight!!<CR>
xmap <leader>l :Limelight!!<CR>
nnoremap <leader>h :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
autocmd FileType python nmap <leader>x :0,$!~/.config/nvim/env/bin/python -m yapf<CR>
nmap <silent> <leader><leader> :noh<CR>
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

" alter + (up or down)
nnoremap <A-Down> :m+<CR>==
inoremap <A-Down> <Esc>:m+<CR>==gi
inoremap <A-Up> <Esc>:m-2<CR>==gi
nnoremap <A-Up> :m-2<CR>==
vnoremap <A-Up> :m-2<CR>gv=gv
vnoremap <A-Down> :m'>+<CR>gv=gv

" save system
nnoremap <C-s> :w<CR>==
inoremap <C-s> <Esc>:w<CR>==gi
vnoremap <C-s> :w<CR>gv=gv

" save with quit system
nnoremap <C-q> :wq<CR>==
inoremap <C-q> <Esc>:wq<CR>==gi
vnoremap <C-q> :wq<CR>gv=gv"}}}

map <C-n> :r ~/.vimbuffer<CR>
vmap <C-c> :w! ~/.vimbuffer \| !cat ~/.vimbuffer \| clip.exe <CR><CR>

" "dict navigation
map <C-h> :<C-w>h <CR>

 map <C-h> <C-w>h
 map <C-j> <C-w>j
 map <C-k> <C-w>k
 map <C-l> <c-w>l
 set nohlsearch
 set mouse=a


" youink the rest of the line
nnoremap Y y$

" searching with purticuler line
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap G Gzz
vnoremap > >gv
vnoremap < <gv

" Find files using Telescope command-line sugar.
nnoremap  <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" git worktree
nnoremap <leader>gw <cmd> :lua require('telescope').extensions.git_worktree.git_worktrees() <CR>


nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv


noremap! <A-BS> <C-w>
noremap! <A-h> <C-w>

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

:set nowrap
nmap <leader>nn :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

com! W w

" NERDTree
let NERDTreeShowHidden=1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Exit Vim if NERDTree is the only window left.

nnoremap <leader>ga :lua require('telescope').extensions.git_worktree.create_git_worktree() <CR>
nnoremap <leader>u :UndotreeShow<CR>
map <leader>g :G <CR>
" wipe out the registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
autocmd VimEnter * WipeReg

" implement the alias to run in command shell
:set shellcmdflag=-ic
"autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))

nmap <leader>ft :Filetypes <CR>

"folding
"{{{

set foldenable
set foldlevelstart=10
set foldnestmax=11
set foldmethod=indent
setlocal foldignore=
noremap <leader><leader> za
noremap <leader>ff zf
au Filetype htmldjango nmap <leader>ff zfit 

autocmd BufWinLeave *.* :mkview
autocmd BufWinEnter *.* silent! :loadview

"}}}

nnoremap <silent><leader>n   :noh <CR>
:call ColorDracula()
let g:airline_mode_map = {
  \ '__'     : '-',
  \ 'c'      : 'C',
  \ 'i'      : 'I',
  \ 'ic'     : 'I',
  \ 'ix'     : 'I',
  \ 'n'      : 'N',
  \ 'multi'  : 'M',
  \ 'ni'     : 'N',
  \ 'no'     : 'N',
  \ 'R'      : 'R',
  \ 'Rv'     : 'R',
  \ 's'      : 'S',
  \ 'S'      : 'S',
  \ ''     : 'S',
  \ 't'      : 'T',
  \ 'v'      : 'V',
  \ 'V'      : 'V',
  \ ''     : 'V',
  \ }


let g:airline_filetype_overrides = {
  \ 'coc-explorer':  [ 'CoC Explorer', '' ],
  \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
  \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
  \ 'floggraph':  [ 'Flog', '%{get(b:, "flog_status_summary", "")}' ],
  \ 'gundo': [ 'Gundo', '' ],
  \ 'help':  [ 'Help', '%f' ],
  \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
  \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
  \ 'startify': [ 'startify', '' ],
  \ 'vim-plug': [ 'Plugins', '' ],
  \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
  \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
  \ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
  \ }


  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

" run selected python code in terminal
vmap <leader><CR> :'<,'>w !python3  <CR>
