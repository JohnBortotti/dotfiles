" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins."
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'vim-scripts/AutoComplPop'
Plug 'airblade/vim-gitgutter' 
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'codota/tabnine-vim'
Plug 'mg979/vim-visual-multi', {'branch':'master'}
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" General configs
set number
set t_Co=256
set encoding=UTF-8
 
" Gitgutter 
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1
highlight GitGutterChangeDelete ctermfg=4
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
set updatetime=100

" Air-line
let g:airline_powerline_fonts = 1

" NerdTree
autocmd VimEnter * NERDTree
let NERDTreeShowHidden=1
nmap <F6> :NERDTreeToggle<CR>

colorscheme gruvbox
