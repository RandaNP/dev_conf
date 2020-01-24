set nocompatible
filetype off			" Required

" Install vim-plug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Install Nerd Fonts if not installed
if has('unix')
	if has('mac')
		if empty(glob('~/Library/Fonts/Sauce Code Pro Nerd Font Complete Mono.ttf'))
			!curl -fLo ~/Library/Fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ Mono.ttf
						\ https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce\%20Code\%20Pro\%20Nerd\%20Font\%20Complete\%20Mono.ttf?raw=true
		endif
	elseif empty(glob('~/.local/share/fonts/Sauce Code Pro Nerd Font Complete Mono.ttf'))
		!curl -fLo ~/.local/share/fonts/Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ Mono.ttf --create-dirs
					\ https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce\%20Code\%20Pro\%20Nerd\%20Font\%20Complete\%20Mono.ttf?raw=true
		!sudo fc-cache -fv ~/.local/share/fonts
	endif
endif


call plug#begin('~/.vim/plugged')

" My Plugins
" VIM gruvbox theme
Plug 'morhetz/gruvbox'
" vim-devicons - adds icons to your plugins
Plug 'ryanoasis/vim-devicons'
" airline header and footer status bar
Plug 'bling/vim-airline'
" close buffers without messing split
Plug 'moll/vim-bbye'
" Sublime Text style multiple selection
Plug 'terryma/vim-multiple-cursors'
" NERDTree
Plug 'scrooloose/nerdtree'
" NERDTree-execute to open pdf, jpeg.. with system editor
Plug 'ivalkeen/nerdtree-execute'
" Syntax highligter
"Plug 'scrooloose/syntastic'
" A.L.E. Asynchronous Lint Engine
Plug 'w0rp/ale'
" DirDiff
Plug 'will133/vim-dirdiff'
" Linediff
" https://github.com/AndrewRadev/linediff.vim.git
Plug 'git://github.com/AndrewRadev/linediff.vim.git', {'name': 'linediff'}
" Emmet.vim - CSS selector style abbreviation expander
Plug 'mattn/emmet-vim'
" vim-easy-align
Plug 'junegunn/vim-easy-align'
" Surround - edit surround quotes, tag, etc..
Plug 'tpope/vim-surround'
" tComment - commentig plugin
Plug 'tomtom/tplugin_vim'
" Vdebug - Multi-language DBGP debugger client for Vim (PHP, Python, Perl,
" Ruby, etc.)
Plug 'joonty/vdebug'
" Vim plugin for .tmux.conf
Plug 'tmux-plugins/vim-tmux'
" MarkDown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Remark.js plugin - convert MarkDown to self contained HTML slideshows
Plug 'idbrii/vim-remarkjs'
" IndentLine - show indentation levels
Plug 'Yggdroot/indentLine'
" ncm2 - Intellisense / Autocomplete / OmniCompletionPlug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-bufword'
"--------------------------------------------------------------------
" LanguageClient (LSP)
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh',
			\ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

call plug#end()

set number relativenumber
syntax enable

" Gruvbox Theme settings
set background=dark
colorscheme gruvbox

" ----- bling/vim-airline settings start -----
"  Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
let g:airline_powerline_fonts=1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled=1

" Show buffer number in tabline
let g:airline#extensions#tabline#buffer_nr_show = 1
" ----- bling/vim-airlines settings end -----

" ----- kien/ctrlp.vim setting start -----
let g:ctrlp_map = '<c-p>'
" ----- kien/ctrlp.vim setting stop -----

" ----- A.L.E. settings start -----
" Airline integration
let g:airline#extensions#ale#enabled = 1
" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5
" sings customization
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
" ----- A-L-E- settings end -------

" ----- iamcco/markdown-preview setting start --
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
			\ 'mkit': {},
			\ 'katex': {},
			\ 'uml': {},
			\ 'maid': {},
			\ 'disable_sync_scroll': 0,
			\ 'sync_scroll_type': 'middle',
			\ 'hide_yaml_meta': 1,
			\ 'sequence_diagrams': {}
			\ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
" ----- iamcco/markdown-preview setting end ----

" ----- Yggdroot/indentLin settings start ------
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" ----- Yggdroot/indentLin settings end --------

" ----- ncm2 settings start --------------------
" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt to be what ncm2 expects
set completeopt=noinsert,menuone,noselect
" ----- ncm2 settings end ----------------------

" ----- LanguageClient-neovim settings start ---
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
			\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
			\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
			\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
			\ 'python': ['/usr/local/bin/pyls'],
			\ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
			\ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> L :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" ----- LanguageClient-neovim settings end -----

" -------------- My settings ----------------
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set noexpandtab
set confirm

" NERDTree
" open NERDTree automatically (without file specified too)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" map C-m to toggle NERDTree
map <C-m> :NERDTreeToggle<CR>
" close VIM if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open default in vertical split if current buffer is not already saved
" NON FUNZIONA, apre tutti i nuovi in vertical split
"autocmd FileType nerdtree nmap <buffer> <CR> s
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeNaturalSort = 1
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"

" Devicons settings
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = 'ﱮ'

" The Silver Searcher
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0

	" bind K to grep word under cursor
	nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

" Let <esc> to clear last search highlighting when then redraw screen
nnoremap <silent> <esc> :nohlsearch<CR><esc>
" More natural Split behaviour
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Buffer navigation
nnoremap <leader>p :bp<CR>
nnoremap <leader>n :bn<CR>

" Start scrolling when we're 8 lines away from margins
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" PHP folding & syntax hilighting
let php_folding = 1        "Set PHP folding of classes and functions.
let php_htmlInStrings = 1  "Syntax highlight HTML code inside PHP strings.
let php_sql_query = 1      "Syntax highlight SQL code inside PHP strings.
let php_noShortTags = 1    "Disable PHP short tags.

