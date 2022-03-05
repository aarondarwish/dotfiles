set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
"set cc=80                  " set an 80 column border for good coding style
set nrformats=alpha
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
"set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                 " enable spell check (may need to download language package)
set spelllang=en_gb
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kamykn/spelunker.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'junegunn/rainbow_parentheses.vim'
" Rust tools
Plug 'neovim/nvim-lspconfig'
"Plug 'simrat39/rust-tools.nvim'
" Optional dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Debugging (needs plenary from above as well)
Plug 'mfussenegger/nvim-dap'
Plug 'lervag/vimtex'
" C++
Plug 'justmao945/vim-clang'
call plug#end()

" Colorscheme options.
colorscheme gruvbox
set bg=dark
"set background=dark
let g:airline_theme='powerlineish'

" EMACS-like/POSIX key bindings in insert mode only
" Mimic Emacs Line Editing in Insert Mode Only
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-E> <End>
inoremap <C-F> <Right>
" â is <Alt-B>
inoremap â <C-Left>
" æ is <Alt-F>
inoremap æ <C-Right>
inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi
inoremap <C-Y> <Esc>Pa
inoremap <C-X><C-S> <Esc>:w<CR>a


" Ascend plugin
" exit if the plugin is already loaded or disabled or when 'compatible' is set
if (exists("g:loaded_visual_increment") && g:loaded_visual_increment) || &cp
    finish
endif
let g:loaded_visual_increment = 1

let s:cpo_save = &cpo
set cpo&vim

" a:step - increment step, default 1
" a:1 - default null, when set to any value, decrement instead
function! s:doincrement(step, ...)
    " visual block start
    let start_column = col("'<")
    let start_row = line("'<")
    " visual block end, as well as the cursor position
    let end_row = line("'>")
    " when 2nd parameter is passed, we are decrementing the numbers instead
    let incrementer = (a:0 > 0 ? '' : '')

    if start_row == end_row
        " just increment/decrement the value if only one line is selected
        exe "normal! ".a:step.incrementer
    else
        " each next line is increased by <a>, from the previous one
        let i = 0
        while line('.') != end_row
            " move to the next line
            call setpos('.', [0, line('.')+1, start_column, 0])
            " if the current line is shorter, skip it
            if start_column < col("$")
                let i += a:step
                " increment the current line by <i>
                exe "normal! ".i.incrementer
            end
        endwhile
    endif
endfunction

vnoremap <silent> <Plug>VisualIncrement :<C-U>call <SID>doincrement(v:count1)<CR>
vnoremap <silent> <Plug>VisualDecrement :<C-U>call <SID>doincrement(v:count1, 1)<CR>

if !hasmapto("<Plug>VisualIncrement")
    vmap <C-A>  <Plug>VisualIncrement
endif
if !hasmapto("<Plug>VisualDecrement")
    vmap <C-X>  <Plug>VisualDecrement
endif

let &cpo = s:cpo_save


" VimTeX Configs

" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
"let g:vimtex_view_general_viewer = 'okular'
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
"let g:vimtex_view_general_options_latexmk = '--unique'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexmk'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
"let maplocalleader = ","

let g:vimtex_compiler_latexmk = {
            \ 'options' : [
                \   '-shell-escape',
                \   '-verbose',
                \   '-file-line-error',
                \   '-synctex=1',
                \   '-interaction=nonstopmode',
                \ ],
                \}
let g:vimtex_compiler_latexmk_engines = {
            \ '_'                : '-xelatex',
            \}
let g:vimtex_format_enabled = 1
let g:vimtex_indent_enabled = 1

" Hide warnings in VimTeX
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \]

let g:coc_node_path = '/home/coder/.nvm/versions/node/v17.2.0/bin/node'

" C++
let g:clang_use_library = 1
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight Normal guibg=none
highlight NonText guibg=none

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Automatically enable the coloured parentheses.
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']]
let g:rainbow#max_level = 16
autocmd VimEnter * RainbowParentheses .
