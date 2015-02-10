
set nocompatible
filetype off

"=================== 插件管理 ===================
if has("win32")
"	set rtp+=$VIM/vimfiles/bundle/vundle/
	set rtp+=$HOME/.vim/bundle/vundle/
else
    set rtp+=~/.vim/bundle/vundle/
endif
call vundle#rc()

" 使用Vundle来管理插件
" vim plugin bundle control, command model
"     :BundleInstall     install 安装配置的插件
"     :BundleInstall!    update  更新
"     :BundleClean       remove plugin not in list 删除本地无用插件
" 	  :BundleList        - list configured bundles
Bundle 'gmarik/vundle'

"如果你的插件来自github，写在下方，只要作者名/项目名就行了
"Bundle 'tpope/vim-fugitive' #如这里就安装了vim-fugitive这个插件
" 如果插件来自 vim-scripts，你直接写插件名就行了
"Bundle 'L9'
" 如使用自己的git库的插件，像下面这样做
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
Bundle 'file:///Users/gmarik/path/to/plugin'

Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
"Bundle 'bling/vim-airline'
 
filetype plugin indent on     " 必须有
"===============================================


set history=2000			" history存储容量
filetype on					" 检测文件类型
filetype indent on			" 针对不同的文件类型采用不同的缩进格式
filetype plugin on			" 允许插件
filetype plugin indent on	" 启动自动补全

set autoread    	" 文件修改之后自动载入      
set nobackup		" 取消备份
set noswapfile		" 关闭交换文件

" 显示设置
syntax on			" 开启语法高亮
set ruler
set showcmd			" 在状态栏显示正在输入的命令
set showmode		" 左下角显示当前vim模式
set number			" 显示行号
set nowrap			" 取消换行
set shortmess=atI	" 启动的时不显示那个援助索马里儿童的提示
set cursorline      " 突出显示当前行

" 设置颜色显示方案
set background=dark
if has('gui_running')
    colorscheme solarized
else
    colorscheme molokai 
endif
set gcr=a:block-blinkon0

" 括号配对
set showmatch
set matchtime=2

" 智能搜索提示
set hlsearch	" 高亮search命中的文本。
set incsearch	" 打开增量搜索模式,随着键入即时搜索
set ignorecase	" 搜索时忽略大小写
set smartcase	" 有一个或以上大写字母时仍大小写敏感

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99

" 缩进配置
set smartindent   " Smart indent
set autoindent    " 打开自动缩进

" Tab相关配置
set tabstop=4     " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4  " 每一次缩进对应的空格数
set softtabstop=4 " 按退格键时可以一次删掉 4 个空格
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set expandtab     " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround    " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'

" 文件编码,格式
set encoding=utf-8
set fileencodings=utf-8,chinese,ucs-bom,gb2312,cp936,gbk,gb18030,big5,shift-jis,latin1
set fileencoding=utf-8
set termencoding=utf-8
if has("win32")
	set termencoding=chinese
endif
set helplang=cn
if has("gui_running")
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif
language messages zh_CN.utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 定义快捷键
let mapleader=";"

:nmap lb 0
:nmap le $
:nmap <Leader>p "+p
:vnoremap <Leader>y "+y
:nmap <S-CR> o<Esc>
:nmap <Leader>q :q<CR>
:nmap <Leader>w :w<CR>
:nmap <Leader>x :wq<CR>
":nmap <Leader>Q :q!<CR>

