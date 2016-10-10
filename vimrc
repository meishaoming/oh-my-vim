set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"Plugin 'lua_omni'
"Plugin 'OmniCppComplete'
"Plugin 'AutoComplPop'
"Plugin 'clang-complete'
Plugin 'molokai'
Plugin 'ctrlp.vim'
Plugin 'ag.vim'
Plugin 'Tagbar'
"Plugin 'ctags.vim'
Plugin 'cscope.vim'
"Plugin 'c.vim'


" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set shell=/bin/bash
colorscheme molokai	" 背景颜色
set guifont=Monaco:h16	"gvim字体设置

map <C-h> :tabp<CR>
map <C-l> :tabn<CR>

set number
set hlsearch
set incsearch 		"查找匹配
set wildmenu
set nobackup		
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set helplang=cn
set completeopt-=preview

syntax enable

" c 排版 http://vimcdoc.sourceforge.net/doc/indent.html
" set cindent
" set cinoptions+=(0
" set cinoptions+=:0
" set cinoptions+=t0
" set cinoptions+=l1
" set shiftwidth=4
" set tabstop=4
" set expandtab
" set smartindent

"光标自动到上次退出该文件时所在位置
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("gui_running")
	set guioptions-=m	"隐藏菜单栏
	set guioptions-=T	"隐藏工具栏
	set guioptions-=L	"隐藏左侧滚动条
	set guioptions-=r	"隐藏右侧滚动条
	set guioptions-=b	"隐藏底部滚动条
	"set showtabline=0	"隐藏Tab栏
endif

" ctrlp
let g:ctrlp_by_filename = 1	"设置默认按文件名搜索
let g:ctrlp_switch_buffer = 'Et' "尝试打开一个文件时，如果已在某个窗口打开，则直接跳到该 buffer，而不是新打开一个实例
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$',
  \ 'file': '\.exe$\|\.so$\|\.o$'
  \ }


" vim-airline
" set status line
set laststatus=2
" enable powerline-fonts
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#exclude_preview = 0
let g:airline_exclude_filetypes = [] " see source for current list
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'
set encoding=utf-8
set ttimeoutlen=50


"ycm 自动补全
let g:ycm_min_num_of_chars_for_completion = 1  
let g:ycm_seed_identifiers_with_syntax=1  
let g:ycm_complete_in_comments=1	"注释中仍然有效
let g:ycm_confirm_extra_conf = 0	"允许加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_warning_symbol = '>>'
let g:ycm_error_symbol = 'xx'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0



"tagbar
nmap mm :TagbarToggle<CR>



" auto-pairs 自动补全括号
let g:AutoPairsFlyMode = 0


" cscope
autocmd FileType * set cscopequickfix=s-,c-,d-,i-,t-,e-,f-
if has("cscope")
	set cscopeprg=/usr/local/bin/cscope
	set cscopetagorder=0
	set cscopetag
	set nocsverb

	if filereadable("cscope.out")
		cs add cscope.out
	endif

	set csverb
endif

