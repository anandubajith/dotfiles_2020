"
" Anandu B Ajith
"

" 
" General Settings
" ----------------
let mapleader = ","				" Setup leader key
set relativenumber					
set fillchars+=vert:\ 				" Get cleaner split separators
highlight LineNr ctermfg=Blue
" Searching
set hlsearch
set incsearch
set ignorecase					
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab  
set cursorline
set backspace=indent,eol,start confirm

"faster scrolling
set ttyfast
set lazyredraw
nmap <leader><space> :nohlsearch<cr>

" Split Management
nmap <C-H> <C-W><C-H>				" Make it easier , remove redundant Ctrl+W
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
set splitbelow					" Default locations for splits
set splitright
" Tab management
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap Q <nop>

"
" Plugins
" -------
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify' 			    " Startup screen
Plug 'ctrlpvim/ctrlp.vim'		        " Fuzzy finding
Plug 'preservim/nerdtree'			    " we need a fileBrowser
Plug 'Xuyuanp/nerdtree-git-plugin'		" For git indicators in NerdTree
Plug 'itchyny/lightline.vim' 			" We need cool statusline
Plug 'tpope/vim-commentary' 			" Easier commenting
"Plug 'morhetz/gruvbox'
Plug 'gosukiwi/vim-atom-dark'
Plug 'ThePrimeagen/vim-be-good'
Plug 'posva/vim-vue'                    " Vue 
Plug 'vimwiki/vimwiki'                  " we want notes
Plug 'ryanoasis/vim-devicons'
call plug#end()

" I think these are required for prettier config
colorscheme atom-dark 
set background=dark termguicolors cursorline
hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

" Plugin specific configs 
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


let g:lightline = { 'colorscheme': 'wombat' }

highlight Pmenu ctermbg=blue guibg=gray

" 
" Mappings
" --------
" I don't want to mistype
command! Q :q

" CtrlP
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:30,results:10'


" NerdTree
map <C-b> :NERDTreeToggle<CR>
nnoremap <leader>ec :tabnew $MYVIMRC<CR>	" Make editing the config easier
" vimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
" Commenting
xnoremap <C-\> gc

" Startify
let g:startify_lists = [ { 'type': 'dir', 'header': ['   MRU '. getcwd()] }]


" 
" AutoCommands
" ------------

" Autosouce the config file on update
augroup autosourcing
	autocmd!
	autocmd BufWritePost init.vim source %
augroup END
" NOTES
" " then register name, and you can paste through registers
" Ctrl+6 to toggle between edit points 
" zz to center the current line
