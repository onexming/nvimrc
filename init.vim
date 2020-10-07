" 配置折叠
" au = autocmd
" au BufWinLeave ?* silent mkview
" au BufWinEnter ?* silent loadview
set ignorecase
set incsearch
set lazyredraw
set magic
set nobackup
set nowb
set noswapfile

" 批量搜索
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

let g:python3_host_prog="/usr/bin/python3"
let g:ruby_host_prog="/usr/bin/ruby"
" 不产生swp 文件
set noswapfile
" let g:mapleader="\<Space>"
let g:mapleader=","
" 使用鼠标
set mouse=a
set nu
set scrolloff=3
"set so等于scrolloff
" 相对行
set relativenumber
" 使用系统剪切板
" set clipboard=unnamed
" inoremap jj <Esc>
" scheme

set termguicolors

hi VertSplit    term=reverse  ctermfg=236  guifg=#303030

" 回到上一次位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" tab键
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" 加载配置
nnoremap <silent><LEADER><C-r> :source $MYVIMRC<CR>
" 打开配置文件
nmap <silent><LEADER><C-f> :set splitright<CR>:vsplit<CR>:e $MYVIMRC<CR>

" 交换
nmap <A-j> mz:m+<cr>`z
nmap <A-k> mz:m-2<cr>`z
vmap <A-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <A-k> :m'<-2<cr>`>my`<mzgv`yo`z

" 分屏
nnoremap <silent><LEADER>sl :set splitright<CR>:vsplit<CR>
nnoremap <silent><LEADER>sj :set splitbelow<CR>:split<CR>
nnoremap <silent><LEADER>sh :set nosplitright<CR>:vsplit<CR>
nnoremap <silent><LEADER>sk :set nosplitbelow<CR>:split<CR>

" 切换分屏
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 分屏切换
nnoremap <silent><LEADER>sL <C-w>t<C-w>H
nnoremap <silent><LEADER>sK <C-w>t<C-w>K

" 分屏大小调整
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" 标签页
noremap <silent><LEADER>t+ :tabe<CR>
nnoremap <silent><LEADER>th :-tabnext<CR>
nnoremap <silent><LEADER>tl :+tabnext<CR>



"==
"=== 插件
"===
call plug#begin("~/.config/nvim/plugged")

Plug 'junegunn/fzf', {'do':{->fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/rainbow_parentheses.vim'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
Plug 'scrooloose/nerdtree'

"md https://zhuanlan.zhihu.com/p/84773275
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'sirver/ultisnips'
Plug 'mzlogin/vim-markdown-toc'
Plug 'plasticboy/vim-markdown'

" 2020年 03月 25日 星期三 14:59:08 CST
Plug 'ferrine/md-img-paste.vim'
 
" 2020年 04月 02日 星期四 21:14:38 CST
Plug 'sirver/ultisnips',{'for':'markdown'}

" 书签位置跳转 https://github.com/MattesGroeger/vim-bookmarks
Plug 'MattesGroeger/vim-bookmarks'
call plug#end()


"===
"===Plug 'ferrine/md-img-paste.vim'
"===
autocmd FileType markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
"nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
"let g:mdip_imgdir = 'img'
"let g:mdip_imgname = 'image'

"===
"=== markdown
"===
"高亮
let g:vim_markdown_math = 1
"在当前光标后生成目录
":GenTocMarked
"更新目录
":UpdateToc
" == previem
" 打开/关闭预览
":MarkdownPreviewToggel
" 指定浏览器路径
let g:mkdp_browser= '/usr/bin/google-chrome-stable'
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
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow = 0
let g:vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"
let g:vim_markdown_math = 1
let g:mkdp_auto_start = 0
let g:vim_markdown_strikethrough = 1
let g:mdip_imgdir = 'pic'
let g:mdip_imgname = 'image'
let g:vim_markdown_folding_disabled = 1


"===
"=== nerdtree
"===
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
noremap <F2> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=25
let g:NERDTreeHidden=0
""打开vim时如果没有文件自动打开NERDTree
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc','\~$','\.swp','\.git']



"===
"=== airline
"===
let g:airline_powerline_fonts=0 "设置箭头符号


"===
"=== rainbow_parentheses
"===
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"===
"=== vim-colors-solarized
"===
"set fillchars=vert:\ 
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256


"===
"=== vim-hybrid
"===
"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
"colorscheme hybrid

"===
"=== SirVer
"===
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-tab>'


"===
"=== FZF
"===
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '$HOME/.config/nvim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

" 函数
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
