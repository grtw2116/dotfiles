" ====================
"     基本設定
" ====================

" 行番号を表示する
set number

" タブはスペース4つ分の幅で表示
set tabstop=4

" 自動インデントの幅
set shiftwidth=4

" クリップボード同期（正確には，無名レジスタの内容がクリップボードに自動コピーされる）
set clipboard=unnamed

" <LocalLeader>キー変更
let maplocalleader = ","

" Tabキーを押した時にスペースを挿入する 
set expandtab

" 改行時に前の行のインデントを継承する
set autoindent

" C系の文法に従って自動インデント
set smartindent


" ====================
"     mac向け設定
" ====================

if has('mac')
	autocmd InsertLeave * :silent !/opt/homebrew/bin/im-select com.apple.inputmethod.Kotoeri.RomajiTyping.Roman
endif



" ===============================
"     プラグイン読み込み
"     :PlugInstall を忘れずに！
" ===============================

call plug#begin()
" 囲う処理がしやすくなる
Plug 'tpope/vim-surround'

" コメントアウト等の処理がしやすくなる
Plug 'tpope/vim-commentary'

" Tex / LaTeX 向けプラグイン
Plug 'lervag/vimtex'

" ステータスバーをかっこよくする
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ファイルエクスプローラ窓を追加
Plug 'preservim/nerdtree'

" LSP等に対応させる
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" VimでGitを操る
Plug 'tpope/vim-fugitive'

call plug#end()



" ====================
"  vim-airlineの設定
" ====================

" Powerlineフォントを使う
let g:airline_powerline_fonts = 1



" ====================
"     VimTeXの設定
" ====================

" 構文関連の機能をONにするための設定．これがないとVimTeXの一部の機能が動作しない．
syntax enable

" QuickFix画面で警告を表示しない（エラーだけ表示）
let g:vimtex_quickfix_open_on_warning = 0

" macのみ
if has('mac')
    " PDFビューワーをSkimに変更
    let g:vimtex_view_method = 'skim'
else
    " PDFビューワーをOkularに変更
    let g:vimtex_view_method = 'okular'

endif

