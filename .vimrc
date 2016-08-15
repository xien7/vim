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

filetype on
filetype plugin on
filetype indent on

"set foldmethod=indent "set default foldmethod

"set tags+=/opt/local/cpp_src/cpp
"set tags+=/Users/xien/unix/tags
"set tags+=/opt/local/include/boost/boost
" OmniCppComplete 
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1 
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表 
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全 
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口 
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
set completeopt=menuone,menu,longest

"taglist
"let Tlist_Auto_Open = 1             
"let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
"let Tlist_Show_One_File = 1 
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Use_LEFT_Window=1
"let Tlist_File_Fold_Auto_Close=1
"let Tlist_GainFocus_On_ToggleOpen=1
nmap tl :Tlist<cr>

augroup filetype                                                     
	au BufRead,BufNewFile *.flex,*.jflex set filetype=jflex         
augroup END

au Syntax jflex so ~/.vim/syntax/jflex.vim  

set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

"My Bundles:
Bundle 'matrix.vim--Yang'
Bundle 'The-NERD-tree'
Bundle 'WinManager'
Bundle 'JavaBrowser'
Bundle 'Conque-Shell'
Bundle 'javacomplete'
Bundle 'https://github.com/Lokaltog/vim-powerline.git'

"Bundle configuration
" vim power-line configuration
set laststatus=2
set t_Co=256
let g:Powerline_symbols='unicode'
set encoding=utf8

"WinManager
let g:NERDTree_title="[NERDTree]"
let g:winManagerWindowLayout="NERDTree|TagList" 
let g:AutoOpenWinManager=1
let g:winManagerWidth=35

function! NERDTree_Start()  
	exec 'NERDTree'  
endfunction  

function! NERDTree_IsValid()  
	return 1  
endfunction 

nmap wm :WMToggle<cr>  

"JavaBrowser
let JavaBrowser_Ctags_Cmd='/usr/bin/ctags' 
let Javabrowser_Use_Icon = 1
let JavaBrowser_Use_Highlight_Tag = 1

" Java Complete
autocmd Filetype java set omnifunc=javacomplete#Complete                        "这一句是自动补全（好像是）
autocmd Filetype java set completefunc=javacomplete#CompleteParamsInf  "  这一句是参数提示，好像不太好用，
 
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>
autocmd Filetype java,javascript,jsp inoremap <buffer> . .<C-X><C-O><C-P>
