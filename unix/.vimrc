" General Settings
set nocompatible          " Disable Vi compatibility mode
filetype off              " Temporarily disable filetype detection

" Load plugins and customizations
if has("syntax")
  syntax on               " Enable syntax highlighting
endif

filetype plugin indent on  " Enable filetype-specific plugins and indentation

" Appearance
set number                " Show line numbers
set relativenumber        " Show relative line numbers
set cursorline            " Highlight the current line
set showmatch             " Highlight matching brackets
set wrap                  " Enable line wrapping
set linebreak             " Break lines at word boundaries
set scrolloff=8           " Keep 8 lines visible above/below cursor
set sidescrolloff=8       " Keep 8 columns visible to the sides
set colorcolumn=80        " Highlight column 80 (optional)
set background=dark       " Use a dark background
colorscheme desert        " Set color scheme (change to preferred one)

" Tabs and Indentation
set expandtab             " Use spaces instead of tabs
set shiftwidth=4          " Indent with 4 spaces
set tabstop=4             " Tab appears as 4 spaces
set softtabstop=4         " Soft tabs as 4 spaces
set autoindent            " Enable auto-indentation
set smartindent           " Enable smart indentation

" Search
set ignorecase            " Ignore case in search
set smartcase             " Case-sensitive search if uppercase is used
set incsearch             " Show matches as you type
set hlsearch              " Highlight all matches

" Backup and Undo
set undofile              " Enable persistent undo
set undodir=~/.vim/undo/  " Undo directory

" Performance
set lazyredraw            " Redraw only when needed
set timeoutlen=500        " Shorter timeout for mapped sequences
set updatetime=300        " Faster completion

" Key Bindings
nnoremap <C-s> :w<CR>    " Save file with Ctrl-S
inoremap <C-s> <Esc>:w<CR>gi
nnoremap <C-c> :noh<CR>  " Clear search highlighting

" Clipboard
set clipboard=unnamedplus " Use system clipboard

" Custom Commands
command WQ wq
command Wq wq
command W w
command Q q
