set nocompatible
filetype off			" Required

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles
" VIM solarized theme
Bundle 'altercation/vim-colors-solarized'
" VIM tomorrow-theme-vim
Bundle 'd11wtq/tomorrow-theme-vim'
" airline header and footer status bar
Bundle 'bling/vim-airline'
" close buffers without messing split
Bundle 'moll/vim-bbye'
" Sublime Text style multiple selection
Bundle 'terryma/vim-multiple-cursors'
" NERDTree
Bundle 'scrooloose/nerdtree'
" NERDTree-execute to open pdf, jpeg.. with system editor
Bundle 'ivalkeen/nerdtree-execute'
" Syntax highligter
Bundle 'scrooloose/syntastic'
" DirDiff
Bundle "will133/vim-dirdiff"
" Linediff
" https://github.com/AndrewRadev/linediff.vim.git
Bundle "git://github.com/AndrewRadev/linediff.vim.git", {'name': 'linediff'}
" Emmet.vim - CSS selector style abbreviation expander
Bundle 'mattn/emmet-vim'
" vim-easy-align
Bundle 'junegunn/vim-easy-align'
" Surround - edit surround quotes, tag, etc..
"Bundle 'tpope/vim-surround'
" tComment - commentig pligin
Bundle 'tomtom/tplugin_vim'
" Vdebug - Multi-language DBGP debugger client for Vim (PHP, Python, Perl,
" Ruby, etc.)
Plugin 'joonty/vdebug'
" Vim plugin for .tmux.conf
Bundle 'tmux-plugins/vim-tmux'

filetype plugin indent on 	" Required

" Solarized Theme settings
set number
syntax enable
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
try
	color Tomorrow-Night
catch
endtry

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

" ----- scooloose/syntastic setting start ---
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '❌'
let g:syntastic_warning_symbol = '⚠️'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
" ----- scroolose/syntastic setting end ----

" -------------- My settings ----------------
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set noexpandtab

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

"set Vim Explore behave like NERDTree
"set treelist view
"let g:netrw_liststyle = 3
"set open in previous window to the right
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"set width in %
"let g:netrw_winsize = 16
"hide informative banner
"let g:netrw_banner = 0
"launch on vim loading
"augroup ProjectDrawer
	"autocmd!
	"autocmd VimEnter * :Vexplore
	"autocmd VimEnter * :set winfixwidth
"augroup END

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
" More natural Split behaviour
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Start scrolling when we're 8 lines away from margins
set scrolloff=8 
set sidescrolloff=15
set sidescroll=1

" PHP folding & syntax hilighting
let php_folding = 1        "Set PHP folding of classes and functions.
let php_htmlInStrings = 1  "Syntax highlight HTML code inside PHP strings.
let php_sql_query = 1      "Syntax highlight SQL code inside PHP strings.
let php_noShortTags = 1    "Disable PHP short tags.

" Vdebug settings
let g:vdebug_options = {
			\"port" : 9000,
			\"break_on_open": 0,
			\"path_maps" : {
			\		"/usr/share/vte": "/Volumes/vte.newcomm.it/usr/share/vte"
			\		}
			\}
