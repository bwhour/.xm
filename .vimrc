" Turn on syntax highlighting
syntax on

" Security
set modelines=0

"==============================================================================
" vim 内置配置 
"==============================================================================

" 设置 vimrc 修改保存后立刻生效，不用在重新打开
" 建议配置完成后将这个关闭
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 关闭兼容模式
set nocompatible

set nu " 设置行号
set cursorline "突出显示当前行
" set cursorcolumn " 突出显示当前列
set showmatch " 显示括号匹配

" tab 缩进
set tabstop=4 " 设置Tab长度为4空格
set shiftwidth=4 " 设置自动缩进长度为4空格
set autoindent " 继承前一行的缩进方式，适用于多行注释

" 定义快捷键的前缀，即<Leader>
let mapleader=";" 

" ==== 系统剪切板复制粘贴 ====
" v 模式下复制内容到系统剪切板
vmap <Leader>c "+yy
" n 模式下复制一行到系统剪切板
nmap <Leader>c "+yy
" n 模式下粘贴系统剪切板的内容
nmap <Leader>v "+p

" 开启实时搜索
set hlsearch                " 开启高亮显示结果
set incsearch
" 搜索时大小写不敏感
set ignorecase
syntax enable
syntax on                    " 开启文件类型侦测
filetype plugin indent on    " 启用自动补全

" 退出插入模式指定类型的文件自动保存
au InsertLeave *.go,*.sh,*.php write

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim


" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

command! JsonF :execute '%!python3 -m json.tool' | :execute '%!python2 -c "import re,sys;sys.stdout.write(re.sub(r\"\\\u[0-9a-f]{4}\", lambda m:m.group()    .decode(\"unicode_escape\").encode(\"utf-8\"), sys.stdin.read()))"'

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" On-demand loading
Plug 'ycm-core/YouCompleteMe', {'do': 'python3 install.py --go-completer'}  " ./install.py --all # 支持大多数语言
" 为啥ycm不支持gopls呢？？？？
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['']
let g:ycm_key_invoke_completion = ''
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_clangd_uses_ycmd_caching = 1
let g:ycm_language_server = [
  \   {
  \     'name': 'gopls',
  \     'cmdline': ['gopls', '~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/go/bin/gopls', '-rpc.trace'],
  \     'filetypes': [ 'go' ],
  \   },
  \ ]
let g:go_def_mode='~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/go/bin/gopls'
let g:go_info_mode='~/.vim/plugged/YouCompleteMe/third_party/ycmd/third_party/go/bin/gopls'
" 在屏幕的右边显示>>标识这样有错误（注意这个是ycm的功能，不是syntastic的功能，syntastic
" 貌似也有这功能，但是显示不出来。。。,需要用:Errors才能看到错误列表）
let g:ycm_show_diagnostics_ui = 1
let g:ycm_error_symbol = '>>'
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" cp ~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/
map <LEADER>gd :YcmCompleter GoTo<CR>

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
map <F7> :NERDTreeMirror<CR>
map <F7> :NERDTreeToggle<CR>

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*','do': ':GoUpdateBinaries' }

Plug 'nsf/gocode', { 'tag': 'v.20170907', 'rtp': 'vim' }
" Multiple Plug commands can be written in a single line using | separators
imap <F6> <C-x><C-o>

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

Plug 'dgryski/vim-godef'
let g:godef_split=3 """左右打开新窗口的时候
let g:godef_same_file_in_same_window=1 """函数在同一个文件中时不需要打开新窗口

Plug 'majutsushi/tagbar', { 'do': 'cp -R ./plugin ~/.vim/' }
let g:tagbar_width = 30
nmap <F9> :TagbarToggle<CR>
let g:tagbar_autopreview = 1
let g:tagbar_sort = 0

"for rust plug
Plug 'rust-lang/rust.vim'

" Initialize plugin system
call plug#end()
