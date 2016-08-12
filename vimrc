let mapleader=" "

" 让配置立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 搜索时大小写不敏感
set ignorecase
" vim 自身命令行模式智能补全
set wildmenu

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'dyng/ctrlsf.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'majutsushi/tagbar'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'suan/vim-instant-markdown'
" 插件列表结束
call vundle#end()
filetype plugin indent on

" 主题颜色
set background=light
colorscheme solarized

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" 设置 gvim 显示字体
set guifont=Source\ Code\ Pro:h14


" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
" set guioptions-=l
" set guioptions-=L
" set guioptions-=r
" set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
" set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" INSERT模式的光标样式
set guicursor=i:ver1

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>ch :FSRight<cr>

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>kb :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" ----- syntastic settings begin -----
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" ----- syntastic settings finish -----

" ----- CtrlP settings begin -----
let g:ctrlp_extensions = ['buffertag']
" ----- CtrlP settings end -----

" ----- vimwiki settings begin -----
let g:vimwiki_list = [{'path': '~/Documents/mywiki'}]

" ----- vimwiki settings end  -----

" ----- Nerdcommenter settings begin -----
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
" ----- Nerdcommenter settings end -----

" ----- vim-fswitch settings begin -----
let b:fswitchdst = 'cc,cpp,cxx,c'
" ----- vim-fswitch settings begin -----

" ----- tagbar settings -----
nmap <Leader>bb :TagbarToggle<CR>

" ----- Python json shortcut -----
nmap <Leader>jj :%!python -m json.tool<CR>
