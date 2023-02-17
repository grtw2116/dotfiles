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

" 非同期のコード校正（Asynchronous Lint Engineの略）
Plug 'dense-analysis/ale'

" Icebergのテーマ
Plug 'cocopon/iceberg.vim'

call plug#end()



" ====================
"   nerdtreeの設定
" ====================

" :NERDTreeToggleを<C-n>に割り当てる
map <C-n> :NERDTreeToggle<CR>



" ====================
"   icebergの設定
" ====================
" カラースキームをicebergに変更
colorscheme iceberg
set background=dark

" True Color（24bit色表示）に対応させる
set termguicolors



" ====================
"  vim-airlineの設定
" ====================

" Powerlineフォントを使う
let g:airline_powerline_fonts = 1

" タブ機能を有効化
let g:airline#extensions#tabline#enabled = 1



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
    " PDFビューワーをSumatraPDFに変更
    let g:vimtex_view_general_viewer = '/mnt/c/Users/taru0/Appdata/Local/SumatraPDF/SumatraPDF.exe'
    let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
endif



" ====================
"   aleの設定
" ====================

" LaTeXの校正を設定
let g:ale_linters = { 'latex': ['textlint'] }


" ====================
"     coc-nvimの設定
" ====================

" <CR>で補完を決定
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" <Tab>で補完を選択
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
