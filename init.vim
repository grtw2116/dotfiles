" クリップボード同期（正確には，無名レジスタの内容がクリップボードに自動コピーされる）
set clipboard=unnamed

" <LocalLeader>キー変更
let maplocalleader = ","

" ====================
"     mac向け設定
" ====================

if has('mac')
	autocmd InsertLeave * :silent !/opt/homebrew/bin/im-select com.apple.inputmethod.Kotoeri.RomajiTyping.Roman
endif

" ===============================
"     プラグイン読み込み
"     :Pluginstall を忘れずに！
" ===============================

call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'lervag/vimtex'
call plug#end()

" ====================
"     VimTeXの設定
" ====================

" 構文関連の機能をONにするための設定．これがないとVimTeXの一部の機能が動作しない．
syntax enable
