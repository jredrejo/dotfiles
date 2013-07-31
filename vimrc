" Mezcla hecha de:
" 
" https://github.com/jredrejo/vim-as-a-python-ide
" http://unlogic.co.uk/posts/vim-python-ide.html
" http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide
" https://github.com/joedicastro/dotfiles/tree/master/vim
" https://github.com/fisadev/fisa-vim-config
"
" Dependencias necesarias:
" vim con soporte de python
" apt-get  install vim-nox pep8 pyflakes exuberant-ctags

set nocompatible
filetype off
set encoding=utf-8

" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
    " Línea de estdo más funcional para vim"

    Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
    Bundle 'scrooloose/nerdtree'
    Bundle 'Gundo'

    Bundle 'pyflakes.vim'
    " Class/module browser
    Bundle 'majutsushi/tagbar'

    "Python-mode
    Bundle 'klen/python-mode'

    " Python and PHP Debugger
    "Bundle 'fisadev/vim-debug.vim'

    " Para gestionar Git
    Bundle 'tpope/vim-fugitive'
    " Para señalar los cambios del archivo con respecto al repo Git
    Bundle 'airblade/vim-gitgutter'
    " Visor de Git
    Bundle 'gregsexton/gitv'

    " Tab list panel
    Bundle 'kien/tabman.vim'

    " Ctrl-p
    Bundle 'kien/ctrlp.vim'

        if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end
"

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source % 



" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current indow
noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red        
"au InsertLeave * match ExtraWhitespace /\s\+$/  

" Use <leader>l to toggle display of whitespace
nmap <leader>l :set list!<CR>

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
"" set t_Co=256
"" color wombat256mod

" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
"set colorcolumn=80
highlight ColorColumn ctermbg=233 

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*



" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*



"" Python mode
" " Keys:
" " K             Show python docs
" " <Ctrl-Space>  Rope autocomplete
" " <Ctrl-c>g     Rope goto definition
" " <Ctrl-c>d     Rope show documentation
" " <Ctrl-c>f     Rope find occurrences
" " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" " [[            Jump on previous class or function (normal, visual, operator modes)
" " ]]            Jump on next class or function (normal, visual, operator modes)
" " [M            Jump on previous class or method (normal, visual, operator modes)
" " ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0
"
" " Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"
" "Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"

" run pep8+pyflakes+pylint validator with \8
autocmd FileType python map <buffer> <leader>8 :PyLint<CR>

" Auto check on save
let g:pymode_lint_write = 1
"
" " Support virtualenv
let g:pymode_virtualenv = 1
"
" " Enable breakpoints plugin
" let g:pymode_breakpoint = 1
" let g:pymode_breakpoint_key = '<leader>b'
"
" " syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
"
" " Don't autofold code
let g:pymode_folding = 1
"


" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
" opciones puestas:
" related_names = all names that are related (have same origin):
let g:jedi#related_names_command = "<leader>z"
" no salta al pulsar el . :
let g:jedi#popup_on_dot = 1
"Jedi selects the first line of the completion menu: for a better typing-flow and usually saves one keypress:
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
         if a:action == 'j'
             return "\<C-N>"
         elseif a:action == 'k'
             return "\<C-P>"
         endif
    endif
    return a:action
endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_file = $HOME.'/.vim/tmp/Powerline.cache'

set noshowmode

" call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" Nerdtree
map <F3> :NERDTreeToggle<CR>

" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" toggle Tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 1

"testing
" debugger keyboard shortcuts
"map <F5> :Dbg over<CR>
"map <F6> :Dbg into<CR>
"map <F7> :Dbg out<CR>
"map <F8> :Dbg here<CR>
"map <F9> :Dbg break<CR>
"map <F10> :Dbg watch<CR>
"map <F11> :Dbg down<CR>
"map <F12> :Dbg up<CR>

" use 256 colors when possible
" if &term =~? 'mlterm\|xterm\|xterm-256\|screen-256'
"     let &t_Co = 256
"     colorscheme fisa
 "else
  "   colorscheme delek
" endif

let g:gitgutter_enabled = 1
