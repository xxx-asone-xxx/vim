"===========================================
"初期設定
"===========================================

"-------------------------------------------
"バックアップファイルを作るディレクトリ
"-------------------------------------------
set backupdir=$HOME/.vim/backup

"-------------------------------------------
"機能を設定する
"-------------------------------------------
set browsedir=buffer		"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set clipboard=unnamed		"クリップボードをWindowsと連携
set directory=$HOME/.vim/backup	"スワップファイル用のディレクトリ
set number			"行番号を表示する
set smartindent			"新しい行を作ったときに高度な自動インデントを行う
set smarttab			"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set shortmess+=I　		"起動時のメーッセージ表示しない


"-------------------------------------------
" 検索の設定
"-------------------------------------------
set incsearch 			"インクリメンタルサーチを行う
set smartcase			"検索時に大文字を含んでいたら大/小を区別
set nowrapscan			"検索をファイルの先頭へループしない
set hlsearch 			"検索文字の強調表示

"-------------------------------------------
" 表示
"-------------------------------------------
set lines=60
set columns=180
set transparency=20
colorscheme desert

"-------------------------------------------
"フォント設定
"-------------------------------------------
set guifontwide=Osaka:h12
set guifont=Osaka-Mono:h14

"-------------------------------------------
"タブの設定
"-------------------------------------------
set tabstop=4
set softtabstop=4

"-------------------------------------------
"タブ文字表示
"-------------------------------------------
set list
set listchars=eol:$,tab:>\ ,extends:<
"set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

"-------------------------------------------
"入力モード時、ステータスラインのカラーを変更
"-------------------------------------------
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"-------------------------------------------
""日本語入力をリセット
"-------------------------------------------
au BufNewFile,BufRead * set iminsert=0

"-------------------------------------------
"タブ幅をリセット
"-------------------------------------------
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4


"ポップアップ補完メニュー色設定（通常の項目、選択されている項目、スクロール
"バー、スクロールバーのつまみ部分）
""highlight Pmenu ctermbg=8 guibg=#606060
"highlight PmenuSel ctermbg=12 guibg=SlateBlue
""highlight PmenuSbar ctermbg=0 guibg=#404040
"highlight PmenuThumb ctermbg=0 guibg=Red
"
""highlight SpecialKey cterm=underline ctermfg=darkgrey
"highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
""match ZenkakuSpace /　/
