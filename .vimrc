" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

syntax on
set number

set autoindent
set smartindent
set cindent
set tabstop=4
set shiftwidth=4

set showmatch
set incsearch
set hlsearch

filetype off


augroup filetype                                                     
	au BufRead,BufNewFile *.flex,*.jflex set filetype=jflex         
augroup END

au Syntax jflex so ~/.vim/syntax/jflex.vim  

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'winmanager'
Plugin 'taglist.vim'
call vundle#end()
filetype plugin indent on


"""Bundle configuration

"set tags+=/opt/local/cpp_src/cpp
"set tags+=/Users/xien/unix/tags
"set tags+=/opt/local/include/boost/boost
" OmniCppComplete 
"let OmniCpp_NamespaceSearch = 1
"let OmniCpp_GlobalScopeSearch = 1
"let OmniCpp_ShowAccess = 1 
"let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表 
"let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
"let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全 
"let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全 
"let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口 
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
"set completeopt=menuone,menu,longest

" vim power-line configuration
set laststatus=2
set t_Co=256
let g:Powerline_symbols='unicode'
set encoding=utf8

"WinManager
nmap <f3> :WMToggle<cr>  
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList,BufExplorer" 
let g:AutoOpenWinManager=1
let g:winManagerWidth=40

function! NERDTree_Start()
	exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
	return 1
endfunction


"NERDTree
" NerdTree插件的配置信息
""将F2设置为开关NERDTree的快捷键
""nmap <leader>:nt :NERDTree<cr>
map <f2> :NERDTreeToggle<cr>
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
""窗口位置
let g:NERDTreeWinPos='left'
""窗口尺寸
let g:NERDTreeSize=120
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeHidden=0

" taglist
let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联


