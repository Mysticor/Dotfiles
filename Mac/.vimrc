"inoremap jj <Esc>`^ "将esc键映射为jj键，jj键很少连续出现
set nu              "设置显示行号
syntax on           "显示语法高亮
set hlsearch        "搜索显示高亮
set background=dark "设置背景为黑色
colorscheme hybrid  "用插件实现的主题颜色
set cursorline      "光标所在处显示光标线
set showcmd         "显示命令用的
set scrolloff=5     "设置光标移动的时候，上下至少都有五行的可显示部分
set tabstop=4       "设置tab键为4个空格
set relativenumber  "显示光标所在的当前行的行号，其他航都为相对与该行的的相对行号"
set wrap            "自动折行,太长的行分几行显示"

set hlsearch        "搜索时，高亮显示匹配结果"

set incsearch       "输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果"
"set ignorecase      "搜索时忽略大小写，只有出现大写字母时，才会大小写敏感"

set wildmenu        "在：设置中开启tab匹配操作命令清单"
set wildmode=longest:list,full
set undofile
set undodir=~/.vim/undodir
"设置gg=G的缩进由8位变成4位
set ts=4 
set shiftwidth=4



"插件管理部分
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'kien/ctrlp.vim' "normal模式下,直接ctrl+p搜索文件"
Plug 'mhinz/vim-startify'"vim启动界面"
Plug 'w0ng/vim-hybrid' "vim黑色主题"
Plug 'vim-airline/vim-airline' "vim下面的状态栏"
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'      "搜索时忽略大小写，只有出现大写字母时，才会大小写敏感"
Plug 'connorholyday/vim-snazzy'
Plug 'preservim/nerdtree'    "NERDtree"
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vimwiki/vimwiki'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'vim-syntastic/syntastic'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular'
"Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'farmergreg/vim-lastplace'
" Initialize plugin system
call plug#end()
"插件结束部分


"插件配置部分
" ==
" " ==snazzy 
" " ==
color snazzy
let g:SnazzyTransparent = 1

" ==
" " == NERDTree
" " ==
map tt :NERDTreeToggle<CR>
map <C-q> :q<CR>
"map <C-w> :w<CR>
map ss <Plug>(easymotion-s2)
map :f :Files<CR>
" ==
" " == NERDTree-git
" " ==
let g:NERDTreeGitStatusIndicatorMapCustom= {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: 薛剑")
        call append(line(".")+2, "\# mail: xue9835426@gamil.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: XUE JIAN")
        call append(line(".")+2, "    > Mail: xue9835426@gmail.com")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
        call append(line(".")+8, "int main()")
        call append(line(".")+9, "{")
        call append(line(".")+10, "")
        call append(line(".")+11, "}")
        call append(line(".")+12, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

" ==
" " == nerdcommenter
" " ==  
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的    
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim   
let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联  
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"自动打开NERDtree"
"autocmd VimEnter * NERDTree 
