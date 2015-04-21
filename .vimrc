"--------------------------------------------------------------------------------
" 初期設定
"--------------------------------------------------------------------------------
"新しい行のインデントを現在行と同じにする
set autoindent

"バックアップファイルを作るディレクトリ
set backupdir=$HOME/.vim/backup

"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer

"クリップボードをWindowsと連携
set clipboard=unnamed

"Vi互換をオフ
set nocompatible

"スワップファイル用のディレクトリ
set directory=$HOME/.vim/backup

"タブの代わりに空白文字を挿入する
set noexpandtab

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

"インクリメンタルサーチを行う
set incsearch

"タブ文字、行末など不可視文字を表示する
set list

"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<

"行番号を表示する
set number

"シフト移動幅
"set shiftwidth=4

"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

"検索時に大文字を含んでいたら大/小を区別
set smartcase

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

"ファイル内の  が対応する空白の数
"set tabstop=4

"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

"検索をファイルの先頭へループしない
set nowrapscan

"縦幅
set lines=50

"横幅
set columns=150

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0

"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

"-------------------------
" NeoBundleの設定
"-------------------------
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundle 'Shougo/neobundle.vim'
    call neobundle#end()
"    call neobundle#rc(expand('~/.vim/bundle/'))
endif

"originalrepos on github
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'

NeoBundle 'git://github.com/mattn/emmet-vim.git'
NeoBundle 'mattn/emmet-vim'

"NeoBundle 'https://bitbucket.org/kovisoft/slimv'
filetype plugin indent on     " required!
filetype indent on
syntax on




"-------------------------
" NERDTree
"-------------------------
" NERDTree {{{
:noremap <Leader>t :NERDTreeToggle<CR>
"}}}

"NERD_commenter {{{
"<Leader>xでコメントをトグル(NERD_commenter.vim)
let g:NERDCreateDefaultMappings = 0
map <Leader>x <Plug>NERDCommenterToggle
"}}}

let file_name = expand("%")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * NERDTree ./
endif


"-------------------------
"-------------------------
""NeoComplecache
set completeopt=menuone "補完候補が１つだけでも表示
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1 " 大文字が入力されるまで大文字小文字の区別を無視
let g:neocomplcache_enable_underbar_completion=1 " スネークケースの補完を有効化
let g:neocomplcache_enable_camel_case_completion=1 " キャメルケースの補完を有効化
let g:neocomplcache_max_list=20 " ポップアップメニューで表示される候補の数
let g:neocomplcache_min_syntax_length=3 " シンタックスをキャッシュするときの最小文字長
inoremap <expr><TAB>   pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>"   : "\<S-TAB>"
" 改行、Deleteキーで補完ウィンドウを閉じる
function! s:my_cr_func()
    return pumvisible() ? neocomplcache#smart_close_popup() : "\<CR>"
endfunction
inoremap <silent> <CR> <C-R>=<SID>my_cr_func()<CR>
inoremap <expr><C-h> neocomplcache#smart_close_popup() . ”\<C-h>”

" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()
" 現在選択している候補をキャンセルし、ポップアップを閉じます
inoremap <expr><C-e> neocomplcache#cancel_popup()
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell/command-history'
    \ }

""Omni Completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns={}
endif

let g:neocomplcache_omni_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c='\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp='\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

"NeoComplecache_Snippets
let g:neocomplcache_snippets_dir='~/.vim/snippets' " snippetの配置場所
"キーマップ
imap <C-k> <plug>(neocomplcache_snippets_expand)
smap <C-k> <plug>(neocomplcache_snippets_expand)

"grep 用
autocmd QuickFixCmdPost *grep* cwindow
