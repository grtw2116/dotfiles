if has('mac')
	autocmd InsertLeave * :silent !/opt/homebrew/bin/im-select com.apple.inputmethod.Kotoeri.RomajiTyping.Roman
endif

" VSCode Neovim でのみの設定
if exists('g:vscode')
	call plug#begin()
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'lervag/vimtex'
	call plug#end()
endif

" プラグインの読み込み
call plug#begin()
Plug 'lervag/vimtex'
call plug#end()

" ===================
"     VimTeXの設定
" ===================

" 構文関連の機能をONにするための設定．これがないとVimTeXの一部の機能が動作しない．
syntax enable

" ビューワーの指定
let g:vimtex_view_method = 'zathura'

" コンパイル方法の指定
let g:vimtex_compiler_method = 'latexrun'

" vim の localleader に関する設定
let maplocalleader = ','
