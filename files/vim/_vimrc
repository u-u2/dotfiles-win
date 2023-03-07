set number

set hlsearch
set incsearch

set splitbelow

set wildmenu

set expandtab
set tabstop=2
set shiftwidth=0

syntax enable

nnoremap <silent>.
\   <F5>.
\   :source $MYVIMRC<CR>

nnoremap <silent>.
\   <Esc><Esc>.
\   :noh<CR>

nnoremap <silent>.
\   <Space><Space>.
\   :let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>

nnoremap <silent> <Space>r :reg<CR>
nnoremap <silent> <Space>m :marks<CR>
nnoremap <silent> <Space>t :tags<CR>
nnoremap <silent> <Space>w :w<CR>
nnoremap <silent> <Space>q :q<CR>
nnoremap x "_x
nnoremap s "_s

nmap <C-h>.
\    <Space><Space>:%s/<C-r>///g<Left><Left>
